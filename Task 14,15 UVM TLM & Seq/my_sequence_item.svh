class my_sequence_item extends uvm_sequence_item ;
`uvm_object_utils(my_sequence_item)
rand logic                           rst             ;
rand logic                           en              ;
rand logic   [31:0]                  data_in         ;
rand logic   [3:0]                   address         ;
logic        [31:0]                  data_out        ;
logic                                valid_out       ;

function new(string name = "my_sequence_item");
super.new(name);
endfunction

constraint transact 
{
    rst dist {0:/98 , 1:/2} ;
    en  dist {0:/50 , 1:/50} ;
    data_in dist {32'h00000000:/35,[32'h00000001:32'hfffffffe]:/20,32'hffffffff:/40,32'h55555555:/5};
}

endclass