class my_agent extends uvm_agent ; 
`uvm_component_utils(my_agent)
my_sequencer sequencer ;
my_driver driver ;
my_monitor monitor ;

uvm_analysis_port#(my_sequence_item) AP_agt ;

virtual Memory_interface agent_mon_drv  ;

function new (string name = "my_agent", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Agent = [%0t]",$time);
    sequencer = my_sequencer::type_id::create("sequencer",this);
    driver = my_driver::type_id::create("driver",this);
    monitor = my_monitor::type_id::create("monitor",this);

    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","my_vif",agent_mon_drv))
        `uvm_error(get_full_name(),"Error in receiving Res from env !")
    uvm_config_db#(virtual Memory_interface)::set(this,"monitor","my_vif_mon",agent_mon_drv);
    uvm_config_db#(virtual Memory_interface)::set(this,"driver","my_vif",agent_mon_drv);
    AP_agt = new("AP_agt",this);
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Agent = [%0t]",$time);
    monitor.AP_mon.connect(this.AP_agt) ;
    driver.seq_item_port.connect(sequencer.seq_item_export) ;
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Agent = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Agent = [%0t]",$time);
endfunction 

endclass