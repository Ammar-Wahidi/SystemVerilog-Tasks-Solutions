class my_sequence_rand extends uvm_sequence;
`uvm_object_utils(my_sequence_rand)
my_sequence_item item ;

function new (string name = "my_sequence_rand");
super.new(name);
endfunction

task pre_body ();
item = my_sequence_item::type_id::create("item") ; 
endtask

task body();
    repeat(5000)
    begin
        start_item(item);
        assert(item.randomize());
        $display("--------------------------seq_rand---------------------------------");
        item.print();  
        finish_item(item);
    end
endtask

endclass 