package Memory_sequence_item_pkg;

class Memory_sequence_item;
logic                           rst             ;
logic                           en              ;
logic [31:0]                    data_in         ;
logic [3:0]                     address         ;
logic [31:0]                    data_out        ;
logic                           valid_out       ;

task sequence_item (virtual Memory_interface seq_pointer);
seq_pointer.rst     =   rst                         ;
seq_pointer.en      =   en                          ;
seq_pointer.data_in =   data_in                     ;
seq_pointer.address =   address                     ;
data_out            =   seq_pointer.data_out        ;
valid_out           =   seq_pointer.valid_out       ;
endtask
endclass

endpackage 