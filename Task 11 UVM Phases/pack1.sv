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

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Driver = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Driver = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Driver = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Driver = [%0t]",$time);
endfunction


endclass

class my_monitor extends uvm_monitor ;

function new (string name = "my_monitor", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Monitor = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Monitor = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Monitor = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Monitor = [%0t]",$time);
endfunction


endclass

class my_sequencer extends uvm_sequencer#(my_sequence_item) ;

function new (string name = "my_sequencer", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Sequencer = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Sequencer = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Sequencer = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Sequencer = [%0t]",$time);
endfunction


endclass

class my_agent extends uvm_agent ;

function new (string name = "my_agent", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Agent = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Agent = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Agent = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Agent = [%0t]",$time);
endfunction


endclass

class my_scoreboard extends uvm_scoreboard ;

function new (string name = "my_scoreboard", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Scoreboard = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Scoreboard = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Scoreboard = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Scoreboard = [%0t]",$time);
endfunction

endclass

class my_subscriber extends uvm_subscriber#(my_sequence_item) ;

function new (string name = "my_subscriber", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Subscriber = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Subscriber = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Subscriber = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Subscriber = [%0t]",$time);
endfunction


function void write (my_sequence_item t);
endfunction 
endclass

class my_env extends uvm_env ;

function new (string name = "my_env", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build env = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect env = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run env = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check env = [%0t]",$time);
endfunction


endclass 

class my_test extends uvm_test ;

function new (string name = "my_test", uvm_component parent=null);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("build Test = [%0t]",$time);
endfunction 

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("connect Test = [%0t]",$time);
endfunction

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Test = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Test = [%0t]",$time);
endfunction

endclass

endpackage 

