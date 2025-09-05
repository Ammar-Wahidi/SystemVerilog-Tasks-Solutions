module structures ();
struct {
string s ;
integer i ;
byte b ;

struct packed { // default unsigned
logic [3:0] p_l1 ;
logic [1:0] p_l2 ;
} pack_6bit  ;

struct {
event e ;
real x ;
} unpacked_inside ;
  
struct packed { // default unsigned
  logic [5:2] p_l11 ;
  logic [1:0] p_l22 ;
} act_pack_6bit  ;

} Q1 ;

 struct packed {
logic [12:6] ele1   ;
logic [5:0]  ele2   ;
} Q2    ;
  
initial
begin
Q1.s = "Hello World" ;
Q1.i = 30 ;
Q1.b = 16 ; 
Q1.pack_6bit.p_l1 = 15 ;
Q1.pack_6bit.p_l2 = 1  ;
Q1.unpacked_inside.x = 12.4 ;
$display(Q1.s) ;
$display(Q1.i) ;
$display(Q1.b) ;
$display(Q1.pack_6bit.p_l1) ;
$display(Q1.pack_6bit.p_l2) ;
  $display(Q1.pack_6bit[1]) ;
$display(Q1.unpacked_inside.x) ;
@(Q1.unpacked_inside.e) 
$display("e is triggered") ;

  
  Q1.act_pack_6bit = 6'b110101 ;
  $display("p_l11 = %d",Q1.act_pack_6bit[5:2]) ;  // p_l11

#15 ;
  Q1 = '{"hw2",33,26 ,'{3,4},'{null,333.2},15};
$display(Q1.s) ;
$display(Q1.i) ;
$display(Q1.b) ;
$display(Q1.pack_6bit.p_l1) ;
$display(Q1.pack_6bit.p_l2) ;
$display(Q1.unpacked_inside.x) ;

#15 ;
Q2 = 13'b0110111_001111 ;
$display (Q2.ele1) ; 
$display (Q2.ele2) ;
  
end

initial 
begin
    #10
    ->Q1.unpacked_inside.e ;
end


endmodule