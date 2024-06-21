vdel -all -lib work
vlib work

vlog AES_key_exp/*.sv
vlog AES_rounds/*.sv
vlog controller/*.sv
vlog *.sv

vsim -voptargs=+acc work.AES_128_TB


do {wave.do}

run -all