class my_subscriber extends uvm_subscriber#(my_sequence_item) ;
`uvm_component_utils(my_subscriber)
my_sequence_item item_sub ;

function new (string name = "my_subscriber", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    item_sub = my_sequence_item::type_id::create("item_sub");
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
endfunction 

function void write (my_sequence_item t);
endfunction 
endclass