
virtual class class1 ;

pure virtual function int fun1 (int a);


pure virtual function int fun2 (int b);

endclass

class class2 extends class1 ;
function int fun1 (int a);
  return a + 1;   // implementation required
endfunction
function int fun2 (int b);
  return b + 1;   // implementation required
endfunction
endclass

class class3 extends class1;
function int fun1 (int a);
  return a + 1;   // implementation required
endfunction
function int fun2 (int b);
  return b + 1;   // implementation required
endfunction
endclass
  
  module top();
    
  endmodule
  




