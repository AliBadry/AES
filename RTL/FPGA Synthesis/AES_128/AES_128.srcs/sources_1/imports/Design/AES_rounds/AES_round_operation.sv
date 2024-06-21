module AES_rounds_operation #(
    parameter DATA_WIDTH = 128,
                KEY_WIDTH = 128
) (
    interface rounds_intf
);
//=========in/out signals definition=======//
logic clk, rst_n;
logic [DATA_WIDTH-1:0] input_vector;
logic [KEY_WIDTH-1:0]   round_keys;
logic rounds_MUX1, rounds_MUX2;
logic FF2_enable, FF1_enable_comp;
logic [DATA_WIDTH-1:0] cipher_text;

//============assign interface signals========//
assign clk = rounds_intf.clk;
assign rst_n = rounds_intf.rst_n;
assign input_vector = rounds_intf.input_vector;
assign round_keys = rounds_intf.round_key;
assign rounds_MUX1 = rounds_intf.rounds_MUX1;
assign rounds_MUX2 = rounds_intf.rounds_MUX2;
assign FF2_enable = rounds_intf.FF2_enable;
assign FF1_enable_comp = rounds_intf.FF1_enable_comp;
assign rounds_intf.cipher_text = cipher_text; 
//===========internal signals definition==========//
logic [DATA_WIDTH-1:0] FF1_out;
//logic [DATA_WIDTH-1:0] FF2_out;
//logic [DATA_WIDTH-1:0] FF2_in;
logic [DATA_WIDTH-1:0] FF_before_MUX2_in0, FF_before_MUX2_in1;
logic [DATA_WIDTH-1:0] adder1_out, adder2_out;
logic [DATA_WIDTH-1:0] MUX1_out, MUX2_out;
logic [DATA_WIDTH-1:0] shift_rows_in, shift_rows_out;
logic [DATA_WIDTH-1:0] mix_columns_out;
//=========assign internal signals============//
assign adder1_out = FF1_out ^ round_keys;
assign adder2_out = MUX2_out ^ round_keys;

//---------sequential blocks-----------//
always_ff @( posedge clk, negedge rst_n ) begin 
    if(!rst_n) begin
        FF1_out <= 'b0;
    end
    else begin
        FF1_out <= input_vector;
    end
end
always_ff @( posedge clk, negedge rst_n ) begin 
    if(!rst_n) begin
        //FF1_out <= 'b0;
        //FF2_out <= 'b0;
        FF_before_MUX2_in0 <= 'b0;
        FF_before_MUX2_in1 <= 'b0;
    end
    else if(FF1_enable_comp) begin
        //FF1_out <= input_vector;
        //FF2_out <= FF2_in;
        FF_before_MUX2_in0 <= mix_columns_out;
        FF_before_MUX2_in1 <= shift_rows_out;
    end
end

always_ff @(posedge clk, negedge rst_n) begin
    if(!rst_n)
        cipher_text <= 'b0;
    else if(FF2_enable)
        cipher_text <= adder2_out; 
end

//============instantiations=============//
MUX2x1 #(.DATA_WIDTH(DATA_WIDTH)) MUX1 (.in0(adder1_out), .in1(adder2_out), .sel(rounds_MUX1), .out(MUX1_out));

genvar i;
for (i =0 ;i< DATA_WIDTH/8; i++ ) begin
    S_box_v2 U_sbox (.clk(clk), .address(MUX1_out[(i+1)*8-1:i*8]), .data_out(shift_rows_in[(i+1)*8-1:i*8]));
end

shift_rows #(.DATA_WIDTH(DATA_WIDTH)) SR1 (.shift_rows_in(shift_rows_in), .shift_rows_out(shift_rows_out));

mix_columns #(.DATA_WIDTH(32)) MC1 (.mix_columns_in(shift_rows_out[31:0]), .mix_columns_out(mix_columns_out[31:0]));
mix_columns #(.DATA_WIDTH(32)) MC2 (.mix_columns_in(shift_rows_out[63:32]), .mix_columns_out(mix_columns_out[63:32]));
mix_columns #(.DATA_WIDTH(32)) MC3 (.mix_columns_in(shift_rows_out[95:64]), .mix_columns_out(mix_columns_out[95:64]));
mix_columns #(.DATA_WIDTH(32)) MC4 (.mix_columns_in(shift_rows_out[127:96]), .mix_columns_out(mix_columns_out[127:96]));

MUX2x1 #(.DATA_WIDTH(DATA_WIDTH)) MUX2 (.in0(FF_before_MUX2_in0), .in1(FF_before_MUX2_in1), .sel(rounds_MUX2), .out(MUX2_out));

endmodule