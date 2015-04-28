//Justin Liang
//ECE 154A
//Homework 1, Problem 1e


module jk_ff(q, q_bar, j, k, a_reset, reset, enable, clk);
  output q;
  output q_bar;
  input j;
  input k;
  input a_reset;
  input reset;
  input enable;
  input clk;
  
  //Create a wire out that uses the characteristc equation of a JK flip flop
  wire out;
  assign out = (j & ~q) | (~k & q);
  
  //Instantiate a d flip flop but instead of having d as data, it is the characteristic equation shown above
  d_ff jk_ff1(q, q_bar, out, a_reset, reset, enable, clk);
  
endmodule
