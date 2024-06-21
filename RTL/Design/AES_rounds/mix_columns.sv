module mix_columns #(
    parameter DATA_WIDTH = 32
) (
    input logic [DATA_WIDTH-1:0] mix_columns_in,
    output logic [DATA_WIDTH-1:0] mix_columns_out
);

//============internal signals definition=========//
logic [8:0] add1_small_out, add2_small_out, add3_small_out, add4_small_out;
logic [8:0] add1_big_out, add2_big_out, add3_big_out, add4_big_out;
logic [8:0] add1_small_optional, add2_small_optional, add3_small_optional, add4_small_optional;
logic [8:0] MUX_out1, MUX_out2, MUX_out3, MUX_out4;
//===========internal assignment=========//

//----------for the first byte------------//
assign add1_small_out = {mix_columns_in[23:16],1'b0} ^ {1'b0,mix_columns_in[23:16]};
assign add1_big_out = add1_small_out ^ {1'b0,mix_columns_in[7:0]} ^ {1'b0,mix_columns_in[15:8]} ^ {mix_columns_in[31:24],1'b0};
assign add1_small_optional = add1_big_out ^ 9'h11B;
MUX2x1 #(.DATA_WIDTH(9)) MUX1 (.in0(add1_big_out), .in1(add1_small_optional), .sel(add1_big_out[8]), .out(MUX_out1));
assign mix_columns_out[31:24] = MUX_out1[7:0];

//------ for second byte----------//
assign add2_small_out = {mix_columns_in[15:8],1'b0} ^ {1'b0,mix_columns_in[15:8]};
assign add2_big_out = add2_small_out ^ {1'b0,mix_columns_in[7:0]} ^ {1'b0,mix_columns_in[31:24]} ^ {mix_columns_in[23:16],1'b0};
assign add2_small_optional = add2_big_out ^ 9'h11B;
MUX2x1 #(.DATA_WIDTH(9)) MUX2 (.in0(add2_big_out), .in1(add2_small_optional), .sel(add2_big_out[8]), .out(MUX_out2));
assign mix_columns_out[23:16] = MUX_out2[7:0];

//------ for third byte----------//
assign add3_small_out = {mix_columns_in[7:0],1'b0} ^ {1'b0,mix_columns_in[7:0]};
assign add3_big_out = add3_small_out ^ {1'b0,mix_columns_in[23:16]} ^ {1'b0,mix_columns_in[31:24]} ^ {mix_columns_in[15:8],1'b0};
assign add3_small_optional = add3_big_out ^ 9'h11B;
MUX2x1 #(.DATA_WIDTH(9)) MUX3 (.in0(add3_big_out), .in1(add3_small_optional), .sel(add3_big_out[8]), .out(MUX_out3));
assign mix_columns_out[15:8] = MUX_out3[7:0];

//------ for fourth byte----------//
assign add4_small_out = {mix_columns_in[31:24],1'b0} ^ {1'b0,mix_columns_in[31:24]};
assign add4_big_out = add4_small_out ^ {1'b0,mix_columns_in[23:16]} ^ {1'b0,mix_columns_in[15:8]} ^ {mix_columns_in[7:0],1'b0};
assign add4_small_optional = add4_big_out ^ 9'h11B;
MUX2x1 #(.DATA_WIDTH(9)) MUX4 (.in0(add4_big_out), .in1(add4_small_optional), .sel(add4_big_out[8]), .out(MUX_out4));
assign mix_columns_out[7:0] = MUX_out4[7:0];

//==============a failed trial to implement the arithmatic equations as a function==========//
/*always_comb begin
    mix_columns_out[7:0]= mathematical_internal({mix_columns_in[15:0],mix_columns_in[31:16]});
    mix_columns_out[15:8] = mathematical_internal({mix_columns_in[7:0],mix_columns_in[31:8]});
    mix_columns_out[23:16] = mathematical_internal(mix_columns_in);
    mix_columns_out[31:24] = mathematical_internal({mix_columns_in[23:0],mix_columns_in[31:24]});
end

function logic [7:0] mathematical_internal(logic [31:0] func_in);

    logic [8:0] add_small_out;
    logic [8:0] add_big_out;
    logic [8:0] mux_out;

    add_small_out = {func_in[7:0],1'b0} ^ {1'b0,func_in[7:0]};
    add_big_out = add_small_out ^ {func_in[15:8],1'b0} ^ {func_in[23:16],1'b0} ^ {func_in[31:24],1'b0};
    mux_out = add_big_out[8]? add_big_out ^ 9'h11B : add_big_out;
    mathematical_internal = mux_out[7:0];

endfunction*/
endmodule