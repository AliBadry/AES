module AES_key_expansion #(
    parameter   KEY_WIDTH = 128,
                RC_WIDTH = 10
) (
    interface expansion_intf
);
//=========in/out signals definition========//
logic clk, rst_n;
logic key_MUX1, key_MUX2;
logic FF1_enable;
logic [$clog2(RC_WIDTH)-1:0] RC_sig;
logic [KEY_WIDTH-1:0] key_vector;
logic [KEY_WIDTH-1:0] round_key;

//========interface assignment=====//
assign clk = expansion_intf.clk;
assign rst_n = expansion_intf.rst_n;
assign key_vector = expansion_intf.key_vector;
assign key_MUX1 = expansion_intf.key_MUX1;
assign key_MUX2 = expansion_intf.key_MUX2;
assign RC_sig = expansion_intf.RC_sig;
assign FF1_enable = expansion_intf.FF1_enable;
assign expansion_intf.round_key = round_key;

//============internal signals==========//
logic [31:0] G_func_input, G_func_output;
logic [KEY_WIDTH-1:0] concatenate_out;
logic [KEY_WIDTH-1:0] FF_input; // for the final flipflop input 

//===========internal assignments=======//
assign concatenate_out[127:96] = G_func_output ^ round_key[127:96];
assign concatenate_out[95:64] = concatenate_out[127:96] ^ round_key[95:64];
assign concatenate_out[63:32] = concatenate_out[95:64] ^ round_key[63:32];
assign concatenate_out[31:0] = concatenate_out[63:32] ^ round_key[31:0];

always_ff @( posedge clk, negedge rst_n ) begin : round_key_flipflop
    if(!rst_n) 
        round_key <= 'b0;
    else if(FF1_enable)
        round_key <= FF_input;
end

//==========internal interface instatiation======//
G_interface G_intf1(.clk(clk), .G_input(G_func_input), .RC_sig(RC_sig), .G_output(G_func_output));

//==============module instantiation==========//
MUX2x1 #(.DATA_WIDTH(32)) MUX2 (.in0(key_vector[31:0]), .in1(round_key[31:0]), .sel(key_MUX2), .out(G_func_input));
MUX2x1 #(.DATA_WIDTH(KEY_WIDTH)) MUX1 (.in0(key_vector), .in1(concatenate_out), .sel(key_MUX1), .out(FF_input));
G_function #(.DATA_WIDTH(32), .RC_WIDTH(RC_WIDTH)) G_Fun1 (G_intf1.G_inouts);
endmodule