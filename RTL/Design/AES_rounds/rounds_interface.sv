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
 output input_vector,
 output clk, 
 output rst_n,
 output FF2_enable, 
 output FF1_enable_comp,
 output rounds_MUX1, 
 output rounds_MUX2,
 output round_key,
 input  cipher_text
);
    
endinterface //rounds_interface