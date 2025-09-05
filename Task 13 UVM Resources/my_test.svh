class my_test extends uvm_test ;
`uvm_component_utils(my_test)
my_env env ;
my_sequence seq ;

virtual Memory_interface intf ;

function new (string name = "my_test", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","vif",intf))
        `uvm_fatal(get_full_name(),"Error in receving Res from top !")
    uvm_config_db#(virtual Memory_interface)::set(this,"env","my_vif",intf);

    seq = my_sequence::type_id::create("seq",this) ;
    env = my_env::type_id::create("env",this) ;
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