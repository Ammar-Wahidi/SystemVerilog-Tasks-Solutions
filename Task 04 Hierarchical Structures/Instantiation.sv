module bot1 ();
logic       bot1_reg          ;

initial 
begin
      $display(top.top_reg);              // absoulute path 
      $display($root.top.top_reg);        // root defined 
      // 12 times 
end
endmodule

module bot2();
logic [3:0] bot2_reg          ;
endmodule

module bot3();
logic [7:0] bot2_reg          ;
endmodule

module mid1();

logic [3:0] mid1_reg          ;

genvar i;
for(i=0;i<3;i++)
bot1 bot();

endmodule

module mid2();

logic [3:0] mid2_reg          ;
bot1 bot[3] ();

endmodule

module wrapper #(P1 = 20) ();

logic       wrap_reg          ;
bind mid1 mid2 mid();
generate;
    case(P1)
    10: bot2 bot();
    20: bot3 bot();
    endcase
endgenerate

endmodule

module top #(P1 = 20) ();

logic       top_reg           ;
generate;
  if (P1 == 20)
        mid1 mid();
  else if (P1 == 10)
        mid2 mid();
endgenerate

endmodule

