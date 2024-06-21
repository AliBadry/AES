interface rounds_interface #(
    parameter   DATA_WIDTH = 128,
                KEY_WIDTH = 128  
)(
    input logic [DATA_WIDTH-1:0] input_vector,
    input logic clk, rst_n,
    input logic FF2_enable, FF1_enable_comp,
    input logic rounds_MUX1, rounds_MUX2,
    input logic [KEY_WIDTH-1:0] round_key,
    output logic [DATA_WIDTH-1:0] cipher_text
);

modport rounds_inout (
 input input_vector,
 input clk, 
 input rst_n,
 input FF2_enable, 
 input FF1_enable_comp,
 input rounds_MUX1, 
 input rounds_MUX2,
 input round_key,
 output  cipher_text
);
    
endinterface //rounds_interface