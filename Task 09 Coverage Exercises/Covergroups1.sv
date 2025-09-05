class randd;
  randc logic [6:0] a ;
randc logic [6:0] b ;
endclass

module top();
  covergroup group_1 (ref logic [6:0] x, ref logic [6:0] y);
x_c: coverpoint x {
  bins b1 = (1,2,19=>22);
    bins b2[] = {7,10} ;
    bins b3[] = {24,32,38,46};
    bins b4 = default ; 
}
coverpoint y {
  bins b1[] = {[1:$]};
  bins b2 = (2=>3) ;
  bins b3 = (1=>4,2=>5,1=>5,2=>4);
  bins b4 = (7[*3]=>8);
}
endgroup

group_1 cv1 ;
randd ra ;
initial 
begin
    ra = new();
    cv1 = new (ra.a,ra.b);
  repeat (5000)
    begin
    void'(ra.randomize());
      cv1.sample();
    end
    
end

endmodule 