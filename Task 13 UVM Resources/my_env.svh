class my_env extends uvm_env ; // agent, scoreboard, subscriber
`uvm_component_utils(my_env)
my_agent agent ;
my_scoreboard scoreboard ;
my_subscriber subscriber ;

virtual Memory_interface config_virtual  ;

function new (string name = "my_env", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent = my_agent::type_id::create("agent",this) ;
    scoreboard = my_scoreboard::type_id::create("scoreboard",this) ;
    subscriber = my_subscriber::type_id::create("subscriber",this) ;

    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","my_vif",config_virtual))
        `uvm_fatal(get_full_name(),"Error!")
    uvm_config_db#(virtual Memory_interface)::set(this,"agent","my_vif",config_virtual);
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