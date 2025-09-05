`include "task2h.svh"

module task2();

int x  = 9 ;
int y  = 5 ;
`M1(5,4)
`M1(`M2,`plus(10,`M2))
initial
begin 
    `ifdef plus
        $display(`plus(5,4));
    `endif
end

`M1(x,y)


endmodule