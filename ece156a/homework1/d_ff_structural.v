// Justin Liang
// ECE 154A
// Structural DFF used using master-slave implementation on Wikipedia

module d_ff_structural(q, q_bar, d, a_reset, reset, enable, clk);
  
  output q, q_bar;
  input d, a_reset, reset, enable, clk;
  wire w1, w2, w3, w4, w5, w6, w7, w8, w9, q, q_bar, d;


  //mux_2_1_structural m(w9, q, d, ~enable); //Uses a MUX implementation with enable as the select value, and Q and D as inputs
  //and (w1, w9, reset);
  and (w1, d, reset, enable); //AND d, reset
  nand (w2, w1, ~clk);
  nand a3(w3, ~w1, ~clk);
  nand a4(w4, w2, w5);
  nand a5(w5, w3, w4);
  nand a6(w6, clk, w4);
  nand a7(w7, w5, clk);
  nand a8(w8, w6, q_bar);
  nand a9(q_bar, q, w7);
  and a10(q, w8, a_reset); //AND q, a_reset
  
   
 endmodule