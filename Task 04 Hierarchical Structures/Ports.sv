
// Q1 
module bot (
input logic driver ,
output tri0 logic tri0_net 
);
assign tri0_net =   driver ;

initial 
begin
driver = 1;
$display ("tri0_net %b",tri0_net)
end

endmodule

// Q2
