module Memory #(parameter address_width = 4, data_with = 32) (clk,rst,en,Data_in,address,data_out,valid_out);

// Synchronous Single Port RAM - en 1 --> wtite / en 0 --> read
input                           clk         ;
input                           rst         ;
input                           en          ;
input   [data_with-1:0]         Data_in     ;
input   [address_width-1:0]     address     ;
output  [data_with-1:0]         data_out    ;
output                          valid_out   ;

reg     [data_with-1:0]         memory [0:(2**address_width)- 1]   ;
reg     [address_width-1:0]     address_reg ;

always @(posedge clk or posedge rst)
begin
        if (rst)
            address_reg      <= 0 ;
        else if (en)
            memory[address]  <= Data_in ;  // Write 
        else 
            address_reg      <= address ;  // For Read 
end

assign data_out = memory[address_reg] ;
assign valid_out = (data_out == memory[address]) && !en ;

//////////////////////////////////////////////////////////////////////
initial 
begin
$readmemh("benchmark.mem",memory);
end
//////////////////////////////////////////////////////////////////////

endmodule