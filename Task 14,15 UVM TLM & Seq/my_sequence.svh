class my_sequence extends uvm_sequence ;
`uvm_object_utils(my_sequence)
my_sequence_item item ;

function new (string name = "my_sequence");
super.new(name);
endfunction

task pre_body ();
item = my_sequence_item::type_id::create("item") ; 
endtask

task body();
    start_item(item) ;
    item.rst = 1'b1 ;
    item.en = 1'b0 ;
    item.data_in = 32'h00000000 ; 
    item.address = 4'h0000 ;
    item.print(); 
    finish_item(item);
    start_item(item) ;
    item.rst = 1'b0 ;
    item.en = 1'b1 ;
    item.data_in = 32'h00000005 ; 
    item.address = 4'h0000 ;
    item.print(); 
    finish_item(item);
    start_item(item) ;
    item.rst = 1'b0 ;
    item.en = 1'b0 ;
    item.data_in = 32'h00000000 ; 
    item.address = 4'h0000 ;
    item.print(); 
    finish_item(item);
    start_item(item) ;
    item.rst = 1'b1 ;
    item.en = 1'b0 ;
    item.data_in = 32'h00000000 ; 
    item.address = 4'h0000 ;
    item.print(); 
    finish_item(item);
endtask 
endclass 