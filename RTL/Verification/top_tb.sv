//`timescale 1ns/1ps
module top_tb ();
    //-------importing uvm packs---------//
    import uvm_pkg::*;
    //`include "uvm_macros.svh"
    import uvm_pack_class::*;

    //--------clock toggling block-----------//
    logic clk_tb;
    initial begin
        clk_tb = 1'b0;
        forever begin
            #5 clk_tb = !clk_tb;
        end
    end

    //-----------rst initializing block----------//
    logic rst_n_tb;
    initial begin
        rst_n_tb = 1'b0;
        #20 rst_n_tb =1'b1;
    end

    //----------instantiating AES top module and its interface--------//
    AES_128_interface intf_main (clk_tb,rst_n_tb);
    AES_128 U_main (intf_main.AES_inout);

    //----------initiating the verification system--------//
    initial begin
        uvm_config_db #(virtual AES_128_interface):: set(null,"uvm_test_top","intf_virtual",intf_main);
        run_test("test_tb");
    end

    
endmodule