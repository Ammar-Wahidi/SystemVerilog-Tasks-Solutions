class class1 ;

typedef struct packed {
logic [7:0] a ;
logic [7:0] b ;
} pack_10bit;

virtual task task1 (int a , byte b );
pack_10bit rev;
rev = a + b ;
$display(rev);
endtask

virtual function pack_10bit fun1 (int a , byte b );
int t ;
fun1 = a + b +t ;
t=t+a;
endfunction

endclass

class class2 extends class1 ;
pack_10bit var1 =20 ;

task task1 (int a, byte b);
if (a+b > 100)
    $display("hello");
else 
    $display("hi");
endtask

 function pack_10bit fun1 (int a , byte b );
fun1 = a*b;
endfunction

endclass

module top();
class1 c1 ;
class2 c2 ;
initial 
begin
    c1 = new();
    c2 = new();
  $display(c1.fun1(5,2));
    c1.task1(10,100);
    c1 = c2 ;
  $display(c1.fun1(5,2));
    c1.task1(10,100);

end
endmodule

/*
# run -all
#     7
#   110
#    10
# hello
*/