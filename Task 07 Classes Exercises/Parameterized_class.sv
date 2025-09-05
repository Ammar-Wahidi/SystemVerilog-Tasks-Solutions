typedef logic[7:0] arr;
class class1#(type p_t = integer , int t = 10) ;

typedef struct packed {
logic [7:0] a ;
logic [2:0] b ;
} pack_10bit;


virtual task task1 (int a , byte b );
pack_10bit rev;
rev = a + b + t;
$display(rev);
endtask

virtual function pack_10bit fun1 (int a , byte b );
fun1 = a + b + t ;
endfunction

endclass

class class2 #(type p_a = arr , int t_a = 88) extends class1#(p_a,t_a)   ;
pack_10bit var1 =20 ;

task task1 (int a, byte b);
if (a+b+t_a > 100)
    $display("hello");
else 
    $display("hi");
endtask

 function pack_10bit fun1 (int a , byte b );
fun1 = a*b + t_a;
endfunction

endclass

module top();
  int x ;
  class1 #(int,8)c1 ;
  class2 #(int,8)c2 ;
initial 
begin
    c1 = new();
    c2 = new();
  x = class1#()::t;
    $display(x);
  $display(c1.fun1(5,2));
    c1.task1(0,50);
  c1 = c2 ;
  $display(c1.fun1(5,2));
    c1.task1(0,51);


end
endmodule

/*
# run -all
#          10
#   15
#   58
#   18
# hi
# exit
*/