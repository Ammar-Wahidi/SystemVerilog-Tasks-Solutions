class my_test extends uvm_test ;
`uvm_component_utils(my_test)
my_env env ;
my_sequence seq ;
my_sequence_rand seq_rand ;
virtual Memory_interface intf ;

function new (string name = "my_test", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Test = [%0t]",$time);
    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","vif",intf))
        `uvm_error(get_full_name(),"Error in receving Res from top !")
    uvm_config_db#(virtual Memory_interface)::set(this,"env","my_vif",intf);
    
    seq = my_sequence::type_id::create("seq",this) ;
    env = my_env::type_id::create("env",this) ;
    seq_rand = my_sequence_rand::type_id::create("seq_rand",this);
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase); 
    $display("connect Test = [%0t]",$time);   
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Test = [%0t]",$time);
    phase.raise_objection (this) ;
    seq.start(env.agent.sequencer) ;
    seq_rand.start(env.agent.sequencer) ;
    phase.drop_objection (this) ;
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Test = [%0t]",$time);
endfunction 

endclass