class my_scoreboard extends uvm_scoreboard ;
`uvm_component_utils(my_scoreboard)
my_sequence_item item_score ;

function new (string name = "my_scoreboard", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    item_score = my_sequence_item::type_id::create("item_score") ;
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


endclass