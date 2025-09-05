class class1 ;
rand bit [9:0] var1;

constraint const1 {
    var1 inside {[10:20],40,45,7};
} 
endclass 

module top();
class1 c1 ;
initial 
begin
  c1 = new ;
  void'(c1.randomize());
    $display(c1.var1);

end
endmodule



