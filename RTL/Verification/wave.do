onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/intf_main/clk
add wave -noupdate /top_tb/intf_main/rst_n
add wave -noupdate /top_tb/intf_main/start_operation
add wave -noupdate /top_tb/intf_main/key_vector
add wave -noupdate /top_tb/intf_main/input_vector
add wave -noupdate /top_tb/intf_main/cipher_text
add wave -noupdate /top_tb/intf_main/data_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {1 us}
