
// Exercise 1
// Q1
typedef struct packed {
logic   x;
int     y;
time    z;
} struct_p ;
module parameters #(parameter type p1 = struct_p,parameter p1 p2 ='{1,7,10})();
endmodule

// Q2,Q3
module top();
parameters #(int,50) P ();

genvar i;
for (i=5;i<2;i--)
    parameters #(int,90) P ();
endmodule

// Exercise 2
/*
// Q1
interface inff ();
localparam type P1 = int ;
localparam int P2  = 20  ;
endinterface

module top ();
  inff #(P1 = time, P2 =6) infff();
endmodule
*/

/*
// Q2
interface #(parameter type P1 = int,parameter int P2  = 20) inff ();
endinterface

module top ();
  inff #(P1 = time, P2 =6) infff();
endmodule
*/