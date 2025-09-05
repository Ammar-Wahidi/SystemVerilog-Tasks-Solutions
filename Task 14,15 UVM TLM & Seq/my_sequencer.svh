class my_sequencer extends uvm_sequencer#(my_sequence_item) ;
`uvm_component_utils(my_sequencer)
my_sequence_item item_sequencer ;

function new (string name = "my_sequencer", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Sequencer = [%0t]",$time);
    item_sequencer = my_sequence_item::type_id::create("item_sequencer");
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Sequencer = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Sequencer = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Sequencer = [%0t]",$time);
endfunction 

endclass
