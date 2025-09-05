class my_scoreboard extends uvm_scoreboard ;
`uvm_component_utils(my_scoreboard)
my_sequence_item item_score ;

int right_count , wrong_count ;
logic valid_out_expeacted ;
logic [31:0] data_out_expeacted ;
reg     [32-1:0]   memory_ref [0:(2**4)- 1]   ;

uvm_analysis_imp#(my_sequence_item,my_scoreboard) AI_score ;

function new (string name = "my_scoreboard", uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    $display("build Scoreboard = [%0t]",$time);
    item_score = my_sequence_item::type_id::create("item_score") ;
    AI_score = new("AI_score",this) ;
endfunction
function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);    
    $display("connect Scoreboard = [%0t]",$time);
endfunction

extern function void write(my_sequence_item t);

task run_phase (uvm_phase phase);
    super.run_phase(phase);
    $display("run Scoreboard = [%0t]",$time);
endtask

function void check_phase (uvm_phase phase);
    super.check_phase(phase);
    $display("check Scoreboard = [%0t]",$time);
endfunction 


endclass

function void my_scoreboard::write(my_sequence_item t);
    item_score = t ;
    `uvm_info ("Scoreboard", $sformatf ("Write Function in Scoreboard"), UVM_MEDIUM)
    if (item_score.rst)
    begin
        memory_ref  = '{default:0}    ;
    end
    else if (item_score.en)
    begin
    memory_ref[item_score.address]  <= item_score.data_in         ;       // Write 
    end

    data_out_expeacted = memory_ref[item_score.address] ;
    valid_out_expeacted = (!item_score.en&&!item_score.rst) ;

    if (item_score.valid_out == valid_out_expeacted &&item_score.data_out == data_out_expeacted  )
    begin
        right_count ++ ;
    end
    else
    begin
        wrong_count ++ ;
    end
    $display("--------------------------score---------------------------------");
    $display("[%0t] score: \nrst = %0b \nen = %0b \nData in = %0h \naddress = %0d \nData out = %0h \nValid out = %0b 
    \nData out expeacted = %0d \nValid out expeacted = %0d",$time
    ,item_score.rst,item_score.en,item_score.data_in,item_score.address,item_score.data_out,item_score.valid_out
    ,data_out_expeacted,valid_out_expeacted);
    $display("Right counts = %0d \nWrong_count = %0d \n\n",right_count,wrong_count);

endfunction