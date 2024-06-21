module AES_128_TB ();


//============internal signals definition========//
logic clk_tb, rst_n_tb;

//=========interface initializing========//
AES_128_interface A128I1 (.clk(clk_tb), .rst_n(rst_n_tb));

//=============top module instantiation==========//
AES_128 A128U1 (A128I1.AES_inout);

//=======clk toggling block=======//
initial begin
    clk_tb = 1'b0;
    forever begin
        #5 clk_tb = ~clk_tb;
    end
end
//========rst initializing block===========//

initial begin
    rst_n_tb = 1'b0;
    #10 rst_n_tb = 1'b1;
end

//============driving the inputs=========//
initial begin
    A128I1.start_operation = 1'b0;
    A128I1.input_vector = 128'h0;
    A128I1.key_vector = 128'h0;

    #5

    @(posedge clk_tb)
    A128I1.input_vector = 128'hd9da7bea1a31d8abe2a27b4e855c5c5c;
    A128I1.key_vector = 128'h50ed00c48388ea9b0fb7c204c2c12d39;
    A128I1.start_operation = 1'b1;
    @(posedge clk_tb)
    A128I1.start_operation = 1'b0;

    @(posedge A128I1.data_valid)
    #50 
    
    @(posedge clk_tb)
    A128I1.input_vector = 128'h40554DC4EDD210B27E4BE5D4D6DCDE0F;
    A128I1.key_vector = 128'h3AB8199730DB8A5CF3F3D1617D956CD7;
    A128I1.start_operation = 1'b1;
    @(posedge clk_tb)
    A128I1.start_operation = 1'b0;

    @(posedge A128I1.data_valid)
    #50
    $stop;
end
endmodule