module casting ();
byte x;
int xx ;
int xx_dyn;
time w ;
time w_dyn ;
enum integer {red = 0, green =1, blue =3} Q2;
initial
begin
    xx = int'(x);
    Q2 = blue ;
    w = time'(Q2);
    $cast(xx_dyn,x);
    $cast(w_dyn,Q2);
    $display(x);
  	$display(Q2);
  	$display(xx);
  	$display(w);
    $display(xx_dyn);
    $display(w_dyn);
end
endmodule