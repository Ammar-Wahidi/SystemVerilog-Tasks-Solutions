module Arrays1();


// Q1
bit [32:0] q1 ;
initial 
begin
    q1 = 40 ;
    $display(q1);
  $display(q1[0:3]);
    $display(q1[9]);
end

// Q2
string s_arr [10] ;

initial
begin
  #5;
  s_arr = '{0:"ju", 1:"jj", 2:"gg", 3:"wh0", default:"wh1"};
    $display(s_arr);
end


// Q3
struct {
string s ;
event e ;
real r ;
logic [2:0] l ;
} str_arr [];

initial
begin
  #10;
  str_arr = new[6] ;
str_arr = '{
  0: '{"hh", null, 89.009, 5},
  1: '{"hh2", null, 0.009, 1},
  2: '{"default", null, 9.009, 3},
  3: '{"default", null, 9.009, 3},
  4: '{"default", null, 9.009, 3},
  5: '{"default", null, 9.009, 3}
};
    $display(str_arr);
    $display(str_arr[0]);
    $display(str_arr[1]);
    $display(str_arr[2]);
    $display(str_arr[3]);
    $display(str_arr[4]);
    $display(str_arr[5]);
    $display("----------------");
  $display("string = %s and its real = %f",str_arr[0].s,str_arr[0].r);
  $display("string2 = %s and its real2 = %f",str_arr[1].s,str_arr[1].r);
  $display("string default = %s and its real default = %f",str_arr[4].s,str_arr[4].r);
end


endmodule