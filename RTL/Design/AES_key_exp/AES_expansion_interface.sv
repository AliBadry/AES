interface AES_expansion_intf #(parameter DATA_WIDTH = 128, RC_WIDTH = 10
) (
    input logic clk,
    input logic rst_n,
    input logic [DATA_WIDTH-1:0] key_vector,
    input logic key_MUX1,
    input logic key_MUX2,
    input logic [$clog2(RC_WIDTH)-1:0] RC_sig,
    input logic FF1_enable,
    output logic [DATA_WIDTH-1:0] round_key
);

modport exp_inout (
    output clk,
    output rst_n,
    output key_vector,
    output key_MUX1,
    output key_MUX2,
    output RC_sig,
    output FF1_enable,
    input round_key
);
    
endinterface //AES_expansion_intf