module RC_rom #(
    parameter RC_WIDTH = 10
) (
    input logic clk,
    input logic [$clog2(RC_WIDTH)-1:0] RC_sig,
    output logic [7:0] RC_rom_out
);
// ======== internal memory definition=========//
logic [7:0] RC_MEM [0:RC_WIDTH-1];

initial begin
    $readmemh("F:/Aloshka/Collage/post collage material/AES/RTL/Design/AES_key_exp/RC_values.txt",RC_MEM);
end

always_ff @(posedge clk) begin
    RC_rom_out <= RC_MEM[RC_sig];
end

endmodule