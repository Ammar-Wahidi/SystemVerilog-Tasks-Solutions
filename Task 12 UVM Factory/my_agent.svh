class my_agent extends uvm_agent ; 
`uvm_component_utils(my_agent)
my_sequencer sequencer ;
my_driver driver ;
my_monitor monitor ;

function new (string name = "my_agent", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sequencer = my_sequencer::type_id::create("sequencer",this);
    driver = my_driver::type_id::create("driver",this);
    monitor = my_monitor::type_id::create("monitor",this);
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