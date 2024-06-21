interface G_interface#(DATA_WIDTH = 32, RC_WIDTH = 10)
            (input logic clk,
            input logic [DATA_WIDTH-1:0]    G_input,
            input logic [$clog2(RC_WIDTH)-1:0]        RC_sig,
            output logic [DATA_WIDTH-1:0]      G_output);

modport G_inouts (
output G_output,
input clk,
input G_input,
input RC_sig
);
endinterface //G_interface(input clk)