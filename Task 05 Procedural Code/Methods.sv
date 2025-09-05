module methods ();
function string Q1 (input integer x , input byte y);
int     z   ;
$display("x = %0d , y = %0d ",x,y);
z=x+y;

if (z>10)
return "hello" ;
else 
return "hi" ;

endfunction

task Q1_task (input integer xx , input byte yy);
if (xx+yy > 10)
$display("hello");
else
$display("hi");
endtask

string     res ;
initial
begin
    res = Q1(3,5);
    $display("Result = %0d ",res) ;
    Q1_task(6,5);
end 

endmodule