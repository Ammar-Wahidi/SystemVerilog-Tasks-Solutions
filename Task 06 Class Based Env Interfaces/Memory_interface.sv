interface Memory_interface(clk);
input bit                       clk             ;
logic                           rst             ;
logic                           en              ;
logic [31:0]                    data_in         ;
logic [3:0]                     address         ;
logic [31:0]                    data_out        ;
logic                           valid_out       ;

modport DUT (input clk,rst,en,data_in,address,output data_out,valid_out);

endinterface