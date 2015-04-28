// Justin Liang
// ECE 154A

module upcnt(count, start, a_reset, s_reset, clk);
  output [3:0] count;
  input start, a_reset, s_reset, clk;
  wire w1,w2,w3,w4,w5;
  wire [3:0] q_bar;
  wire [3:0] count;
  
  xor(w1, count[0], count[1]);
  xor(w2, count[2], w4);
  xor(w3, count[3], w5);
  
  and(w4, count[0], count[1]);
  and(w5, count[2], w4);
    
  d_ff_structural t0(count[0],q_bar[3], ~count[0], a_reset, s_reset, start, clk);
  d_ff_structural t1(count[1],q_bar[2], w1, a_reset, s_reset, start, clk);
  d_ff_structural t2(count[2],q_bar[1], w2, a_reset, s_reset, start, clk);
  d_ff_structural t3(count[3],q_bar[0], w3, a_reset, s_reset, start, clk);
  
endmodule 