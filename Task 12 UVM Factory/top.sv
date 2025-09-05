module top();
import uvm_pkg ::* ;
import Memory_package_UVM ::* ;
bit       clk                           ;

Memory_interface intf(clk)              ;

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
end  
endmodule