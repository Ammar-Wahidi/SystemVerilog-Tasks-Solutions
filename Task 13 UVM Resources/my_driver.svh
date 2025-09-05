class my_driver extends uvm_driver#(my_sequence_item) ;
`uvm_component_utils(my_driver)
my_sequence_item item_drv ;

virtual Memory_interface vif ;

function new (string name = "my_driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    item_drv = my_sequence_item::type_id::create("item_drv");
    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","my_vif",vif))
    begin
        `uvm_fatal(get_full_name(),"Error in receving Res from agt !")
    end
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