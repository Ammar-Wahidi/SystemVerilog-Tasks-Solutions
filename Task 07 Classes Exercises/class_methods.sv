// Q1
class class1 ;

typedef struct packed {
logic [7:0] a ;
logic [2:0] b ;
} pack_10bit;

static function static pack_10bit fun1 (int a , byte b );
int t ;
fun1 = a + b +t ;
t=t+a;
endfunction

endclass

module top();
class1 c1 ;
initial 
begin
    c1 = new();
    $display(c1.fun1(10,10));
    $display(c1.fun1(10,30));
    $display(class1::fun1(10,30));
end
endmodule
/*
# run -all
#    20
#    50
#    60
# exit
*/
// Q2 
class class2 ;

typedef struct packed {
logic [7:0] a ;
logic [7:0] b ;
} pack_10bit;

task task1 (int a , byte b );
int t ;
pack_10bit rev;
rev = a + b ;
$display(rev);
t=t+a;
endtask

endclass

module top2();
class2 c2 ;
initial 
begin
    #20;
    c2 = new();
    c2.task1(10,10);
    c2.task1(10,30);
    c2.task1(10,30);
end
endmodule

/*
#    20
#    40
#    40
*/