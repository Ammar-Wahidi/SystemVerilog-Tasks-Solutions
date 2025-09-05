Vlog Memory.sv Memory_package_UVM.sv top.sv Memory_interface.sv +cover
vsim top -novopt -cover -coverage -suppress 12110 
add wave -r /*
add wave -position end  /top/DUT/memory
coverage save top.ucdb -onexit
run -all; 
vcover report top.ucdb -details -all -annotate -output mem_UVM_cvr.txt