module AES_128 #(
    parameter   DATA_WIDTH = 128,
                KEY_WIDTH = 128,
                RC_WIDTH = 10
) (
    interface top_intf
);
//===========interface signals definitions=========//
logic                   clk, rst_n;
logic                   start_operation;
logic [KEY_WIDTH-1:0]   key_vector;
logic [DATA_WIDTH-1:0]  input_vector;
logic [DATA_WIDTH-1:0]  cipher_text;
logic                   data_valid;
//==========interface assignment===========//
assign clk = top_intf.clk;
assign rst_n = top_intf.rst_n;
assign start_operation = top_intf.start_operation;
assign key_vector = top_intf.key_vector;
assign input_vector = top_intf.input_vector;
assign top_intf.cipher_text = cipher_text;
assign top_intf.data_valid = data_valid;

//=============internal signals definition==========//
logic                           key_MUX1, key_MUX2;
logic [$clog2(RC_WIDTH)-1:0]    RC_sig;
logic                           FF1_enable, FF2_enable;
logic [KEY_WIDTH-1:0]           round_key;
logic                           rounds_MUX1, rounds_MUX2;
//===========internal signals assignment=========//

//========interface instatiation==========//
AES_expansion_intf #(.DATA_WIDTH(KEY_WIDTH), .RC_WIDTH(RC_WIDTH)) AEI1(
    .clk        (clk        ),
    .rst_n      (rst_n      ),
    .key_vector (key_vector ),
    .key_MUX1   (key_MUX1   ),
    .key_MUX2   (key_MUX2   ),
    .RC_sig     (RC_sig     ),
    .FF1_enable (FF1_enable ),
    .round_key  (round_key  )
);

rounds_interface #(.DATA_WIDTH(DATA_WIDTH), .KEY_WIDTH(KEY_WIDTH)) ARI1(
    .input_vector   (input_vector   ),
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .FF2_enable     (FF2_enable     ),
    .FF1_enable_comp(!FF1_enable    ),
    .rounds_MUX1    (rounds_MUX1    ),
    .rounds_MUX2    (rounds_MUX2    ),
    .round_key      (round_key      ),
    .cipher_text    (cipher_text    )
);

//===========module instatiation======//
AES_key_expansion #(.KEY_WIDTH(KEY_WIDTH), .RC_WIDTH(RC_WIDTH)) AKE1 (AEI1.exp_inout);

AES_rounds_operation #(.DATA_WIDTH(DATA_WIDTH), .KEY_WIDTH(KEY_WIDTH)) ARO1 (ARI1.rounds_inout);

controller #(.RC_WIDTH(RC_WIDTH)) CU1 (
    .clk                (clk                ),
    .rst_n              (rst_n              ),
    .start_operation    (start_operation    ),
    .key_MUX1           (key_MUX1           ),
    .key_MUX2           (key_MUX2           ),
    .rounds_MUX1        (rounds_MUX1        ),
    .rounds_MUX2        (rounds_MUX2        ),
    .FF_key_enable      (FF1_enable         ),
    .FF_round_enable    (FF2_enable         ),
    .RC_sig             (RC_sig             ),
    .data_valid         (data_valid         )
);
endmodule