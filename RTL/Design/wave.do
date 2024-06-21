onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/clk
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/rst_n
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/start_operation
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/key_vector
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/input_vector
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/cipher_text
add wave -noupdate -group Top_interface /AES_128_TB/A128I1/data_valid
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/clk
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/rst_n
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/input_vector
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/round_keys
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/rounds_MUX1
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/rounds_MUX2
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/FF2_enable
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/cipher_text
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/FF1_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/FF_before_MUX2_in0
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/FF_before_MUX2_in1
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/adder1_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/adder2_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/MUX1_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/MUX2_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/shift_rows_in
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/shift_rows_out
add wave -noupdate -group {rounds operation} /AES_128_TB/A128U1/ARO1/mix_columns_out
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/clk
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/rst_n
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/key_MUX1
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/key_MUX2
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/FF1_enable
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/RC_sig
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/key_vector
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/round_key
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/G_func_input
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/G_func_output
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/concatenate_out
add wave -noupdate -group key_expansion /AES_128_TB/A128U1/AKE1/FF_input
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/clk
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/rst_n
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/start_operation
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/key_MUX1
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/key_MUX2
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/rounds_MUX1
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/rounds_MUX2
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/FF_key_enable
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/FF_round_enable
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/RC_sig
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/data_valid
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/current_state
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/next_state
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/counter_comb
add wave -noupdate -group controller /AES_128_TB/A128U1/CU1/counter_seq
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/G_input
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/clk
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/RC_sig
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/G_output
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/box_out
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/RC_rom_out
add wave -noupdate -group G_function /AES_128_TB/A128U1/AKE1/G_Fun1/xor_in
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/mix_columns_in
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/mix_columns_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add1_small_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add2_small_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add3_small_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add4_small_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add1_big_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add2_big_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add3_big_out
add wave -noupdate -group {mix columns1} /AES_128_TB/A128U1/ARO1/MC1/add4_big_out
add wave -noupdate -group {mix columns1} -radix binary /AES_128_TB/A128U1/ARO1/MC1/MUX_out1
add wave -noupdate -group {mix columns1} -radix binary /AES_128_TB/A128U1/ARO1/MC1/MUX_out2
add wave -noupdate -group {mix columns1} -radix binary /AES_128_TB/A128U1/ARO1/MC1/MUX_out3
add wave -noupdate -group {mix columns1} -radix binary /AES_128_TB/A128U1/ARO1/MC1/MUX_out4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 260
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {280 ns} {380 ns}
