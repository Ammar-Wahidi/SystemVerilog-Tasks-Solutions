package pack1 ;
import uvm_pkg::*;
`include "uvm_macros.svh"

class my_sequence_item extends uvm_sequence_item ;

function new(string name = "my_sequence_item");
super.new(name);
endfunction

endclass

class my_sequence extends uvm_sequence ;

function new (string name = "my_sequence");
super.new(name);
endfunction

endclass 

class my_driver extends uvm_driver#(my_sequence_item) ;

function new (string name = "my_driver",uvm_component parent=null);
super.new(name,parent);
endfunction

endclass

class my_monitor extends uvm_monitor ;

function new (string name = "my_monitor", uvm_component parent=null);
super.new(name,parent);
endfunction

endclass

class my_sequencer extends uvm_sequencer#(my_sequence_item) ;

function new (string name = "my_sequencer", uvm_component parent=null);
super.new(name,parent);
endfunction

endclass

class my_agent extends uvm_agent ;

function new (string name = "my_agent", uvm_component parent=null);
super.new(name,parent);
endfunction

endclass

class my_scoreboard extends uvm_scoreboard ;

function new (string name = "my_scoreboard", uvm_component parent=null);
super.new(name,parent);
endfunction

endclass

class my_subscriber extends uvm_subscriber#(my_sequence_item) ;

function new (string name = "my_subscriber", uvm_component parent=null);
super.new(name, parent);
endfunction


function void write (my_sequence_item t);
endfunction 
endclass

class my_env extends uvm_env ;

function new (string name = "my_env", uvm_component parent=null);
super.new(name, parent);
endfunction

endclass 

class my_test extends uvm_test ;

function new (string name = "my_test", uvm_component parent=null);
super.new(name, parent);
endfunction

endclass

endpackage 

