module Memory_tb ()                     ;
import Memory_sequence_item_pkg::*      ;

bit       clk                           ;

Memory_interface intf(clk)              ;
// Memory DUT(intf)                     ;
Memory DUT (
.clk(intf.clk)                          ,
.rst(intf.rst)                          ,
.en(intf.en)                            ,
.data_in(intf.data_in)                  ,
.address(intf.address)                  ,
.data_out(intf.data_out)                ,
.valid_out(intf.valid_out)
);
virtual Memory_interface vif            ;

Memory_sequence_item seq                ;

initial    clk = 0                      ;
always #10 clk =~clk                    ;

initial 
begin
vif = intf                          ;
seq = new()                         ;
seq.sequence_item(vif)              ;
$finish;
end

endmodule