class my_driver extends uvm_driver#(my_sequence_item) ;
`uvm_component_utils(my_driver)
my_sequence_item item_drv ;

virtual Memory_interface vif ;

function new (string name = "my_driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Driver = [%0t]",$time);
    item_drv = my_sequence_item::type_id::create("item_drv");
    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","my_vif",vif))
    begin
        `uvm_fatal(get_full_name(),"Error in receving Res from agt !")
    end
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Driver = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase) ;
    forever
    begin
        $display("run Driver = [%0t]",$time) ;
        `uvm_info ("DRIVER", $sformatf ("Waiting for data from sequencer"), UVM_MEDIUM)
        seq_item_port.get_next_item(item_drv);
        @(posedge vif.cb);
        vif.cb.rst     <= item_drv.rst ;
        vif.cb.en      <= item_drv.en ;
        vif.cb.data_in <= item_drv.data_in ;
        vif.cb.address <= item_drv.address ;
        seq_item_port.item_done() ;
    end
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Driver = [%0t]",$time);
endfunction 

endclass