module shift_rows #(
    parameter DATA_WIDTH = 128
) (
    input logic [DATA_WIDTH-1:0] shift_rows_in,
    output logic [DATA_WIDTH-1:0] shift_rows_out
);

assign shift_rows_out[7:0] = shift_rows_in[39:32];
assign shift_rows_out[15:8] = shift_rows_in[79:72];
assign shift_rows_out[23:16] = shift_rows_in[119:112];
assign shift_rows_out[31:24] = shift_rows_in[31:24];
assign shift_rows_out[39:32] = shift_rows_in[71:64];
assign shift_rows_out[47:40] = shift_rows_in[111:104];
assign shift_rows_out[55:48] = shift_rows_in[23:16];
assign shift_rows_out[63:56] = shift_rows_in[63:56];
assign shift_rows_out[71:64] = shift_rows_in[103:96];
assign shift_rows_out[79:72] = shift_rows_in[15:8];
assign shift_rows_out[87:80] = shift_rows_in[55:48];
assign shift_rows_out[95:88] = shift_rows_in[95:88];
assign shift_rows_out[103:96] = shift_rows_in[7:0];
assign shift_rows_out[111:104] = shift_rows_in[47:40];
assign shift_rows_out[119:112] = shift_rows_in[87:80];
assign shift_rows_out[127:120] = shift_rows_in[127:120];
endmodule