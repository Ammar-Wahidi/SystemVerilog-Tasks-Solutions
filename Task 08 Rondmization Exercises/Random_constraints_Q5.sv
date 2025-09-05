class class1 ;
rand bit [9:0] var1;
rand bit [9:0] var2;

constraint const1 {
    var1 inside {[10:20],40,45,7};
} 
constraint const2 {
    var2 dist {10:=1,12:=4,6:=4};
}
constraint const3 {
    unique {var1,var2};
}
constraint const4 {
  if (var2 ==6 )
    var1 inside {[15:18]};
}
endclass 

module top();
class1 c1 ;
initial 
begin
  c1 = new ;
  repeat(50)
  begin
    void'(c1.randomize()with {var2 inside {12,6};});
        $display(c1.var1);
        $display(c1.var2);
  end

end
endmodule



