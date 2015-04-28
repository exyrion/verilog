//Justin Liang
//ECE 154A
//Homework 1, Problem 2e

module jk_ff_structural(q, q_bar, j, k, a_reset, reset, enable, clk);
  output q;
  output q_bar;
  input j;
  input k;
  input a_reset;
  input reset;
  input enable;
  input clk;

  wire a, b;
  wire x = 1;
    
  if(a_reset == 0 || reset == 0 || enable == 0)
    begin
      //Sets q to 0
      not(q, x);
    end
  else
    begin
      //Characterstic equation for JK flip flop
      and(a, j, q_bar);
      and(b, k, q);
      or(q_next, a, b);
    end
  
  not(q_bar, q);
  
  
endmodule

