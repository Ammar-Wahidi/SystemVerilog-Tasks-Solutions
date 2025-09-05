module unions ()

typedef struct packed {
logic [9:0] a ;
logic [9:0] b ;
logic [9:0] c ;
} std_p ;

union {
std_p str ;
logic [29:0] d ;
} un ;

initial
begin
    un.d = 500 ;
    $display(un.str) ;
end
endmodule 