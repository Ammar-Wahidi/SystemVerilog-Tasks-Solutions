class my_monitor extends uvm_monitor ;
`uvm_component_utils(my_monitor)
my_sequence_item item_mon ;

uvm_analysis_port#(my_sequence_item) AP_mon;

virtual Memory_interface vif ;

function new (string name = "my_monitor", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Monitor = [%0t]",$time);
    item_mon = my_sequence_item::type_id::create("item_mon");
    if(!uvm_config_db#(virtual Memory_interface)::get(this,"","my_vif_mon",vif))
    begin
        `uvm_error(get_full_name(),"Error in receving Res from agt !")
    end
    AP_mon = new("AP_mon",this);
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Monitor = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    @(posedge vif.clk)
    forever 
    begin
        $display("run Monitor = [%0t]",$time);
        @(posedge vif.clk)
        item_mon.rst <= vif.rst;
        item_mon.data_out <= vif.data_out ;
        item_mon.valid_out<= vif.valid_out ;

        item_mon.rst <= vif.rst ;
        item_mon.en <= vif.en ;
        item_mon.data_in <= vif.data_in ;
        item_mon.address <= vif.address ;
        #1step AP_mon.write(item_mon);
    end
endtask 

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Monitor = [%0t]",$time);
endfunction 

endclass