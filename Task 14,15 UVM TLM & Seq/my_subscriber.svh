class my_subscriber extends uvm_subscriber#(my_sequence_item) ;
`uvm_component_utils(my_subscriber)
my_sequence_item item_sub ;

covergroup cvg ;
rst_cp : coverpoint item_sub.rst ;
rst_cp_tran : coverpoint item_sub.rst {bins rst_0 = (1=>0=>1);}
en_cp  : coverpoint item_sub.en  {bins read = {0} ; bins write = {1} ;} 
en_cp_tran : coverpoint item_sub.rst {bins r_w = (0=>1) ; bins w_r = (1=>0);}
data_in_cp : coverpoint item_sub.data_in {
    bins data_min = {32'h00000000} ;
    bins data_around = {[32'h00000001:32'hfffffffe]} ;
    bins data_max = {32'hffffffff} ;
    bins data_toggle = {32'h55555555};
}
address_cp : coverpoint item_sub.address ;
address_en_cp : cross address_cp,en_cp ;
address_data : cross address_cp,data_in_cp ;
valid_cp : coverpoint item_sub.valid_out ;
data_out_cp : coverpoint item_sub.data_out {
    bins data_min = {32'h00000000} ;
    bins data_around = {[32'h00000001:32'hfffffffe]} ;
    bins data_max = {32'hffffffff} ;
    bins data_toggle = {32'h55555555};
}
endgroup 

function new (string name = "my_subscriber", uvm_component parent=null);
super.new(name, parent);
cvg = new () ;
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    item_sub = my_sequence_item::type_id::create("item_sub");
    $display("build Subscriber = [%0t]",$time);
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Subscriber = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Subscriber = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Subscriber = [%0t]",$time);
endfunction 

function void write (my_sequence_item t);
    item_sub = t ;
    cvg.sample();
endfunction 

function void report_phase (uvm_phase phase);
    `uvm_info("my_subscriber", $sformatf("coverage =%0d", cvg.get_coverage()), UVM_NONE);
endfunction

endclass