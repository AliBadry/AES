// ==========ROM module of size 16*16 ====================/
module S_box (
    input logic             clk,
    input logic [7:0]     address,
    output logic [7:0]    data_out
);
 
always_ff @( posedge clk ) begin
      case (address)
           8'h00 
             :data_out  <=  8'h 63  ;
           8'h01 
             :data_out  <=  8'h 7C  ;
           8'h02 
             :data_out  <=  8'h 77  ;
           8'h03 
             :data_out  <=  8'h 7B  ;
           8'h04 
             :data_out  <=  8'h F2  ;
           8'h05 
             :data_out  <=  8'h 6B  ;
           8'h06 
             :data_out  <=  8'h 6F  ;
           8'h07 
             :data_out  <=  8'h C5  ;
           8'h08 
             :data_out  <=  8'h 30  ;
           8'h09 
             :data_out  <=  8'h 01  ;
           8'h0A 
             :data_out  <=  8'h 67  ;
           8'h0B 
             :data_out  <=  8'h 2B  ;
           8'h0C 
             :data_out  <=  8'h FE  ;
           8'h0D 
             :data_out  <=  8'h D7  ;
           8'h0E 
             :data_out  <=  8'h AB  ;
           8'h0F 
             :data_out  <=  8'h 76  ;
		       8'h10  
             :data_out  <=  8'h CA  ;
           8'h11 
             :data_out  <=  8'h 82  ;
           8'h12 
             :data_out  <=  8'h C9  ;
           8'h13 
             :data_out  <=  8'h 7D  ;
           8'h14 
             :data_out  <=  8'h FA  ;
           8'h15 
             :data_out  <=  8'h 59  ;
           8'h16 
             :data_out  <=  8'h 47  ;
           8'h17 
             :data_out  <=  8'h F0  ;
           8'h18 
             :data_out  <=  8'h AD  ;
           8'h19 
             :data_out  <=  8'h D4  ;
           8'h1A 
             :data_out  <=  8'h A2  ;
           8'h1B 
             :data_out  <=  8'h AF  ;
           8'h1C 
             :data_out  <=  8'h 9C  ;
           8'h1D 
             :data_out  <=  8'h A4  ;
           8'h1E 
             :data_out  <=  8'h 72  ;
           8'h1F 
             :data_out  <=  8'h C0  ;
		       8'h20  
             :data_out  <=  8'h B7  ;
           8'h21 
             :data_out  <=  8'h FD  ;
           8'h22 
             :data_out  <=  8'h 93  ;
           8'h23 
             :data_out  <=  8'h 26  ;
           8'h24 
             :data_out  <=  8'h 36  ;
           8'h25 
             :data_out  <=  8'h 3F  ;
           8'h26 
             :data_out  <=  8'h F7  ;
           8'h27 
             :data_out  <=  8'h CC  ;
           8'h28 
             :data_out  <=  8'h 34  ;
           8'h29 
             :data_out  <=  8'h A5  ;
           8'h2A 
             :data_out  <=  8'h E5  ;
           8'h2B 
             :data_out  <=  8'h F1  ;
           8'h2C 
             :data_out  <=  8'h 71  ;
           8'h2D 
             :data_out  <=  8'h D8  ;
           8'h2E 
             :data_out  <=  8'h 31  ;
           8'h2F 
             :data_out  <=  8'h 15  ;
		   8'h30  
             :data_out  <=  8'h 04  ;
           8'h31 
             :data_out  <=  8'h C7  ;
           8'h32 
             :data_out  <=  8'h 23  ;
           8'h33 
             :data_out  <=  8'h C3  ;
           8'h34 
             :data_out  <=  8'h 18  ;
           8'h35 
             :data_out  <=  8'h 96  ;
           8'h36 
             :data_out  <=  8'h 05  ;
           8'h37 
             :data_out  <=  8'h 9A  ;
           8'h38 
             :data_out  <=  8'h 07  ;
           8'h39 
             :data_out  <=  8'h 12  ;
           8'h3A 
             :data_out  <=  8'h 80  ;
           8'h3B 
             :data_out  <=  8'h E2  ;
           8'h3C 
             :data_out  <=  8'h EB  ;
           8'h3D 
             :data_out  <=  8'h 27  ;
           8'h3E 
             :data_out  <=  8'h B2  ;
           8'h3F 
             :data_out  <=  8'h 75  ;
		   8'h40  
             :data_out  <=  8'h 09  ;
           8'h41 
             :data_out  <=  8'h 83  ;
           8'h42 
             :data_out  <=  8'h 2C  ;
           8'h43 
             :data_out  <=  8'h 1A  ;
           8'h44 
             :data_out  <=  8'h 1B  ;
           8'h45 
             :data_out  <=  8'h 6E  ;
           8'h46 
             :data_out  <=  8'h 5A  ;
           8'h47 
             :data_out  <=  8'h A0  ;
           8'h48 
             :data_out  <=  8'h 52  ;
           8'h49 
             :data_out  <=  8'h 3B  ;
           8'h4A 
             :data_out  <=  8'h D6  ;
           8'h4B 
             :data_out  <=  8'h B3  ;
           8'h4C 
             :data_out  <=  8'h 29  ;
           8'h4D 
             :data_out  <=  8'h E3  ;
           8'h4E 
             :data_out  <=  8'h 2F  ;
           8'h4F 
             :data_out  <=  8'h 84  ;
		   8'h50  
             :data_out  <=  8'h 53  ;
           8'h51 
             :data_out  <=  8'h D1  ;
           8'h52 
             :data_out  <=  8'h 00  ;
           8'h53 
             :data_out  <=  8'h ED  ;
           8'h54 
             :data_out  <=  8'h 20  ;
           8'h55 
             :data_out  <=  8'h FC  ;
           8'h56 
             :data_out  <=  8'h B1  ;
           8'h57 
             :data_out  <=  8'h 5B  ;
           8'h58 
             :data_out  <=  8'h 6A  ;
           8'h59 
             :data_out  <=  8'h CB  ;
           8'h5A 
             :data_out  <=  8'h BE  ;
           8'h5B 
             :data_out  <=  8'h 39  ;
           8'h5C 
             :data_out  <=  8'h 4A  ;
           8'h5D 
             :data_out  <=  8'h 4C  ;
           8'h5E 
             :data_out  <=  8'h 58  ;
           8'h5F 
             :data_out  <=  8'h CF  ;
		   8'h60  
             :data_out  <=  8'h D0  ;
           8'h61 
             :data_out  <=  8'h EF  ;
           8'h62 
             :data_out  <=  8'h AA  ;
           8'h63 
             :data_out  <=  8'h FB  ;
           8'h64 
             :data_out  <=  8'h 43  ;
           8'h65 
             :data_out  <=  8'h 4D  ;
           8'h66 
             :data_out  <=  8'h 33  ;
           8'h67 
             :data_out  <=  8'h 85  ;
           8'h68 
             :data_out  <=  8'h 45  ;
           8'h69 
             :data_out  <=  8'h F9  ;
           8'h6A 
             :data_out  <=  8'h 02  ;
           8'h6B 
             :data_out  <=  8'h 7F  ;
           8'h6C 
             :data_out  <=  8'h 50  ;
           8'h6D 
             :data_out  <=  8'h 3C  ;
           8'h6E 
             :data_out  <=  8'h 9F  ;
           8'h6F 
             :data_out  <=  8'h A8  ;
		   8'h70  
             :data_out  <=  8'h 51  ;
           8'h71 
             :data_out  <=  8'h A3  ;
           8'h72 
             :data_out  <=  8'h 40  ;
           8'h73 
             :data_out  <=  8'h 8F  ;
           8'h74 
             :data_out  <=  8'h 92  ;
           8'h75 
             :data_out  <=  8'h 9D  ;
           8'h76 
             :data_out  <=  8'h 38  ;
           8'h77 
             :data_out  <=  8'h F5  ;
           8'h78 
             :data_out  <=  8'h BC  ;
           8'h79 
             :data_out  <=  8'h B6  ;
           8'h7A 
             :data_out  <=  8'h DA  ;
           8'h7B 
             :data_out  <=  8'h 21  ;
           8'h7C 
             :data_out  <=  8'h 10  ;
           8'h7D 
             :data_out  <=  8'h FF  ;
           8'h7E 
             :data_out  <=  8'h F3  ;
           8'h7F 
             :data_out  <=  8'h D2  ;
		   8'h80  
             :data_out  <=  8'h CD  ;
           8'h81 
             :data_out  <=  8'h 0C  ;
           8'h82 
             :data_out  <=  8'h 13  ;
           8'h83 
             :data_out  <=  8'h EC  ;
           8'h84 
             :data_out  <=  8'h 5F  ;
           8'h85 
             :data_out  <=  8'h 97  ;
           8'h86 
             :data_out  <=  8'h 44  ;
           8'h87 
             :data_out  <=  8'h 17  ;
           8'h88 
             :data_out  <=  8'h C4  ;
           8'h89 
             :data_out  <=  8'h A7  ;
           8'h8A 
             :data_out  <=  8'h 7E  ;
           8'h8B 
             :data_out  <=  8'h 3D  ;
           8'h8C 
             :data_out  <=  8'h 64  ;
           8'h8D 
             :data_out  <=  8'h 5D  ;
           8'h8E 
             :data_out  <=  8'h 19  ;
           8'h8F 
             :data_out  <=  8'h 73  ;
		   8'h90  
             :data_out  <=  8'h 60  ;
           8'h91 
             :data_out  <=  8'h 81  ;
           8'h92 
             :data_out  <=  8'h 4F  ;
           8'h93 
             :data_out  <=  8'h DC  ;
           8'h94 
             :data_out  <=  8'h 22  ;
           8'h95 
             :data_out  <=  8'h 2A  ;
           8'h96 
             :data_out  <=  8'h 90  ;
           8'h97 
             :data_out  <=  8'h 88  ;
           8'h98 
             :data_out  <=  8'h 46  ;
           8'h99 
             :data_out  <=  8'h EE  ;
           8'h9A 
             :data_out  <=  8'h B8  ;
           8'h9B 
             :data_out  <=  8'h 14  ;
           8'h9C 
             :data_out  <=  8'h DE  ;
           8'h9D 
             :data_out  <=  8'h 5E  ;
           8'h9E 
             :data_out  <=  8'h 0B  ;
           8'h9F 
             :data_out  <=  8'h DB  ;
		   8'hA0  
             :data_out  <=  8'h E0  ;
           8'hA1 
             :data_out  <=  8'h 32  ;
           8'hA2 
             :data_out  <=  8'h 3A  ;
           8'hA3 
             :data_out  <=  8'h 0A  ;
           8'hA4 
             :data_out  <=  8'h 49  ;
           8'hA5 
             :data_out  <=  8'h 06  ;
           8'hA6 
             :data_out  <=  8'h 24  ;
           8'hA7 
             :data_out  <=  8'h 5C  ;
           8'hA8 
             :data_out  <=  8'h C2  ;
           8'hA9 
             :data_out  <=  8'h D3  ;
           8'hAA 
             :data_out  <=  8'h AC  ;
           8'hAB 
             :data_out  <=  8'h 62  ;
           8'hAC 
             :data_out  <=  8'h 91  ;
           8'hAD 
             :data_out  <=  8'h 95  ;
           8'hAE 
             :data_out  <=  8'h E4  ;
           8'hAF 
             :data_out  <=  8'h 79  ;
		   8'hB0  
             :data_out  <=  8'h E7  ;
           8'hB1 
             :data_out  <=  8'h C8  ;
           8'hB2 
             :data_out  <=  8'h 37  ;
           8'hB3 
             :data_out  <=  8'h 6D  ;
           8'hB4 
             :data_out  <=  8'h 8D  ;
           8'hB5 
             :data_out  <=  8'h D5  ;
           8'hB6 
             :data_out  <=  8'h 4E  ;
           8'hB7 
             :data_out  <=  8'h A9  ;
           8'hB8 
             :data_out  <=  8'h 6C  ;
           8'hB9 
             :data_out  <=  8'h 56  ;
           8'hBA 
             :data_out  <=  8'h F4  ;
           8'hBB 
             :data_out  <=  8'h EA  ;
           8'hBC 
             :data_out  <=  8'h 65  ;
           8'hBD 
             :data_out  <=  8'h 7A  ;
           8'hBE 
             :data_out  <=  8'h AE  ;
           8'hBF 
             :data_out  <=  8'h 08  ;
		   8'hC0  
             :data_out  <=  8'h BA  ;
           8'hC1 
             :data_out  <=  8'h 78  ;
           8'hC2 
             :data_out  <=  8'h 25  ;
           8'hC3 
             :data_out  <=  8'h 2E  ;
           8'hC4 
             :data_out  <=  8'h 1C  ;
           8'hC5 
             :data_out  <=  8'h A6  ;
           8'hC6 
             :data_out  <=  8'h B4  ;
           8'hC7 
             :data_out  <=  8'h C6  ;
           8'hC8 
             :data_out  <=  8'h E8  ;
           8'hC9 
             :data_out  <=  8'h DD  ;
           8'hCA 
             :data_out  <=  8'h 74  ;
           8'hCB 
             :data_out  <=  8'h 1F  ;
           8'hCC 
             :data_out  <=  8'h 4B  ;
           8'hCD 
             :data_out  <=  8'h BD  ;
           8'hCE 
             :data_out  <=  8'h 8B  ;
           8'hCF 
             :data_out  <=  8'h 8A  ;
		   8'hD0  
             :data_out  <=  8'h 70  ;
           8'hD1 
             :data_out  <=  8'h 3E  ;
           8'hD2 
             :data_out  <=  8'h B5  ;
           8'hD3 
             :data_out  <=  8'h 66  ;
           8'hD4 
             :data_out  <=  8'h 48  ;
           8'hD5 
             :data_out  <=  8'h 03  ;
           8'hD6 
             :data_out  <=  8'h F6  ;
           8'hD7 
             :data_out  <=  8'h 0E  ;
           8'hD8 
             :data_out  <=  8'h 61  ;
           8'hD9 
             :data_out  <=  8'h 35  ;
           8'hDA 
             :data_out  <=  8'h 57  ;
           8'hDB 
             :data_out  <=  8'h B9  ;
           8'hDC 
             :data_out  <=  8'h 86  ;
           8'hDD 
             :data_out  <=  8'h C1  ;
           8'hDE 
             :data_out  <=  8'h 1D  ;
           8'hDF 
             :data_out  <=  8'h 9E  ;
		   8'hE0  
             :data_out  <=  8'h E1  ;
           8'hE1 
             :data_out  <=  8'h F8  ;
           8'hE2 
             :data_out  <=  8'h 98  ;
           8'hE3 
             :data_out  <=  8'h 11  ;
           8'hE4 
             :data_out  <=  8'h 69  ;
           8'hE5 
             :data_out  <=  8'h D9  ;
           8'hE6 
             :data_out  <=  8'h 8E  ;
           8'hE7 
             :data_out  <=  8'h 94  ;
           8'hE8 
             :data_out  <=  8'h 9B  ;
           8'hE9 
             :data_out  <=  8'h 1E  ;
           8'hEA 
             :data_out  <=  8'h 87  ;
           8'hEB 
             :data_out  <=  8'h E9  ;
           8'hEC 
             :data_out  <=  8'h CE  ;
           8'hED 
             :data_out  <=  8'h 55  ;
           8'hEE 
             :data_out  <=  8'h 28  ;
           8'hEF 
             :data_out  <=  8'h DF  ;
		   8'hF0  
             :data_out  <=  8'h 8C  ;
           8'hF1 
             :data_out  <=  8'h A1  ;
           8'hF2 
             :data_out  <=  8'h 89  ;
           8'hF3 
             :data_out  <=  8'h 0D  ;
           8'hF4 
             :data_out  <=  8'h BF  ;
           8'hF5 
             :data_out  <=  8'h E6  ;
           8'hF6 
             :data_out  <=  8'h 42  ;
           8'hF7 
             :data_out  <=  8'h 68  ;
           8'hF8 
             :data_out  <=  8'h 41  ;
           8'hF9 
             :data_out  <=  8'h 99  ;
           8'hFA 
             :data_out  <=  8'h 2D  ;
           8'hFB 
             :data_out  <=  8'h 0F  ;
           8'hFC 
             :data_out  <=  8'h B0  ;
           8'hFD 
             :data_out  <=  8'h 54  ;
           8'hFE 
             :data_out  <=  8'h BB  ;
           8'hFF 
             :data_out  <=  8'h 16  ;
      endcase
    end 
    
endmodule