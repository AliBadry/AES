interface AES_128_interface #(
    parameter   DATA_WIDTH = 128,
                KEY_WIDTH = 128
)(
    input logic clk, rst_n
);
logic                   start_operation;
logic [KEY_WIDTH-1:0]   key_vector;
logic [DATA_WIDTH-1:0]  input_vector;
logic [DATA_WIDTH-1:0]  cipher_text;
logic                   data_valid;
modport AES_inout (
output clk, rst_n,
output start_operation,
output key_vector,
output input_vector,
input  cipher_text,
input  data_valid
);
endinterface //AES_128_interface