module top_ex_pack();
import pack3 ::*;

initial
begin
    /*
    before export
    failed
    import pack2::*; only imports identifiers explicitly declared in pack2, not what pack2 itself imported.
    $display(pp1);
    $display(pp2);
    */

    // after export
    $display(pp1);
    $display(pp2);

    
end
endmodule