vdel -all -lib work
vlib work

vlog ../Design/AES_key_exp/*.sv 
vlog ../Design/AES_rounds/*.sv 
vlog ../Design/controller/*.sv 
vlog ../Design/*.sv +cover
vlog uvm_pack_class.sv 
vlog top_tb.sv 

vsim -voptargs=+acc work.top_tb -coverage  

do {wave.do}

run -all 
coverage report -codeall -cvg -verbose