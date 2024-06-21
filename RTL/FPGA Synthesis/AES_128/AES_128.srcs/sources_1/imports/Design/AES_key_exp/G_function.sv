module G_function #(
    parameter   DATA_WIDTH = 32,
                RC_WIDTH = 10
) (
    interface G_func_intf
);
//========in/out variables definition==========//
logic [DATA_WIDTH-1:0]    G_input;
logic                       clk;
logic [$clog2(RC_WIDTH)-1:0]        RC_sig;
logic [DATA_WIDTH-1:0]      G_output;

//========interface assignments==============//
assign G_func_intf.G_output = G_output;
assign clk = G_func_intf.clk;
assign G_input = G_func_intf.G_input;
assign RC_sig = G_func_intf.RC_sig;

//==========internal variables definition===========//
logic [DATA_WIDTH-1:0] box_out;
logic [7:0] RC_rom_out;
logic [7:0] xor_in;

//======internal assignments==========//
assign box_out[31:24] = xor_in ^ RC_rom_out;
assign G_output = box_out;

//===========s_box instatiation==========//
S_box BOX1 (.clk(clk), .address(G_input[31:24]), .data_out(box_out[7:0]));
S_box BOX2 (.clk(clk), .address(G_input[7:0]), .data_out(box_out[15:8]));
S_box BOX3 (.clk(clk), .address(G_input[15:8]), .data_out(box_out[23:16]));
S_box BOX4 (.clk(clk), .address(G_input[23:16]), .data_out(xor_in));

//========RC_ROM instantiation=========//
RC_rom #(.RC_WIDTH(RC_WIDTH)) RC1 ( .clk(clk), .RC_sig(RC_sig), .RC_rom_out(RC_rom_out));
    
endmodule