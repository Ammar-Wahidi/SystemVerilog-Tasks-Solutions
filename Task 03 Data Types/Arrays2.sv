module Arrays2 ();

// Q1 
struct 
{
    string s ;
    event  e ;
    real   r ;
    logic [3] pacs_ass ;
} ass_str [string] ;

initial 
begin
    ass_str ["hi"] = '{"hi",null,43.32,2} ;
    ass_str ["hello"] = '{"hello",null,43.3232,5} ;
    ass_str ["hey"] = '{"hey",null,43.3232,3} ;

    $display (ass_str ["hi"]) ;
    $display (ass_str ["hello"]) ;
    $display (ass_str ["hey"]) ;
  $display ("struct hi it's name = %s",ass_str ["hi"].s) ;
  $display ("struct hello it's name = %s",ass_str ["hello"].s) ;
  $display ("struct hey it's name = %s",ass_str ["hey"].s) ;
end

// Q2
struct 
{
    string s ;
    event  e ;
    real   r ;
    logic [3] pacs_ass ;
} ass_str2 [*] ;

initial 
begin
    #10;
    ass_str2 [10] = '{"hi",null,43.10,1} ;
    ass_str2 [20] = '{"hello",null,43.20,5} ;
    ass_str2 [30] = '{"hey",null,43.30,3} ;

    $display (ass_str2 [10]) ;
    $display (ass_str2 [20]) ;
    $display (ass_str2 [30]) ;
  $display ("struct 10 it's name = %s",ass_str2 [10].s) ;
  $display ("struct 20 it's name = %s",ass_str2 [20].s) ;
  $display ("struct 30 it's name = %s",ass_str2 [30].s) ;
end

// Q3
string sq [$] ;

initial
begin
  #20;
    sq.push_front("30") ;
    sq.push_front("33") ;
    sq.push_front("hello") ;
    sq.push_front("can") ;

    $display(sq) ;

    sq.pop_back() ;
    sq.pop_front() ;

    $display(sq) ;
end
endmodule