// ==========ROM module of size 16*16 ====================/
module S_box_v2 (
    input logic             clk,
    input logic [7:0]     address,
    output logic [7:0]    data_out
);

logic [7:0] mem_content [0:255];
initial begin
    $readmemh("F:/Aloshka/Collage/post collage material/AES/RTL/Design/AES_rounds/S_LUT.txt",mem_content);
end
 
always_ff @( posedge clk) begin
    data_out <= mem_content[address];
    end 
    
endmodule