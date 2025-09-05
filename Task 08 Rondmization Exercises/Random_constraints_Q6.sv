class class1 ;
rand bit [9:0] var1;
rand bit [9:0] var2;

constraint const1 {
    var1 inside {[10:20],40,45,7};
} 

endclass 

module top();
class1 c1 ;
initial 
begin
  c1 = new ;
  repeat(5)
  begin
    c1.var1 = 3;
    c1.var2 =4;
    c1.var2.rand_mode(0);
    c1.const1.constraint_mode(0);
    void'(c1.randomize());
        $display(c1.var1);
        $display(c1.var2);
  end

end
endmodule



/*
# run -all
#  713
#    4
#  920
#    4
#  248
#    4
#  342
#    4
#  880
#    4
# exit
*/