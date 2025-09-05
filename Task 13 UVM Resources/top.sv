import uvm_pkg ::* ;
`include "uvm_macros.svh"
import Memory_package_UVM ::* ;
module top();
bit       clk                           ;

Memory_interface intf (clk)              ;

Memory DUT (
.clk(intf.clk)                          ,
.rst(intf.rst)                          ,
.en(intf.en)                            ,
.data_in(intf.data_in)                  ,
.address(intf.address)                  ,
.data_out(intf.data_out)                ,
.valid_out(intf.valid_out)
);

initial    clk = 0                      ;
always #10 clk =~clk                    ;

initial
begin
    run_test("my_test") ;
    uvm_config_db#(virtual Memory_interface)::set(null,"uvm_test_top","vif",intf) ;
end  
endmodule