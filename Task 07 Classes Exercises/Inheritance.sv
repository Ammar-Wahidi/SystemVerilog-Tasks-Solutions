class class1 ;

typedef struct packed {
logic [7:0] a ;
logic [7:0] b ;
} pack_10bit;

task task1 (int a , byte b );
pack_10bit rev;
rev = a + b ;
$display(rev);
endtask

endclass

class class2 extends class1 ;
pack_10bit var1 =20 ;
endclass

module top();
class1 c1 ;
class2 c2 ;
initial 
begin
    c2 = new();
    $display(c2.var1);
    c2.task1(10,10);
    c1 =c2;
   $cast(c2,c1);
end
endmodule