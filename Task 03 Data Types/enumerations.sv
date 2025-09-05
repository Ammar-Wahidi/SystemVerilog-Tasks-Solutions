module enumerations ();

enum integer {x,y=5,z=7,w=9} Q1 ;
enum time {t1 = 1032,t2 = 2003, t3 = 2004 , t4 = 5000 } Q2 ;

initial 
begin
    $display (Q1.first);
    $display (Q2.num) ;
end
endmodule