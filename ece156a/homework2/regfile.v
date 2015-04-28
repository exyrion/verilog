// Justin Liang
// ECE 154A
// 8 x 4-bit register
// 4-bit input "d_in", 4-bit output "d_out", 3-bit address "a_in"
// write enable "we", clock "clk, asynch reset "a_reset"

module regfile(d_out, d_in, a_in, a_reset, we, clk);
  
  output[3:0] d_out;
  input[3:0] d_in;
  input[2:0] a_in;
  input we, clk, a_reset;
  
  //These wires connect each dff's q value to the final 8-to-1 mux
  //Each set of wires connect 
  wire[7:0] w3;
  wire[7:0] w2;
  wire[7:0] w1;
  wire[7:0] w0;
  
  //Filler wire for 2:1 mux's input
  wire[7:0] data;
  
  wire[31:0] q_bar;
  wire d0, d1, d2, d3, d4, d5, d6, d7;
  
  //3:8 decoder to translate 3-bit input to 8-bit inputs for the mux's
  decoder_3_8_structural a1(data, a_in);
  
  //8 2:1 mux's
  mux_2_1_structural m1(d0, 0, data[0], we);
  mux_2_1_structural m2(d1, 0, data[1], we);
  mux_2_1_structural m3(d2, 0, data[2], we);
  mux_2_1_structural m4(d3, 0, data[3], we);
  mux_2_1_structural m5(d4, 0, data[4], we);
  mux_2_1_structural m6(d5, 0, data[5], we);
  mux_2_1_structural m7(d6, 0, data[6], we);
  mux_2_1_structural m8(d7, 0, data[7], we);
  
  //32 dff's
  d_ff x1(w3[0],q_bar[0], d_in[3], a_reset, a_reset, ~d0, clk);
  d_ff x2(w2[0],q_bar[1], d_in[2], a_reset, a_reset, ~d0, clk);
  d_ff x3(w1[0],q_bar[2], d_in[1], a_reset, a_reset, ~d0, clk);
  d_ff x4(w0[0],q_bar[3], d_in[0], a_reset, a_reset, ~d0, clk);


  d_ff x5(w3[1],q_bar[4], d_in[3], a_reset, a_reset, ~d1, clk);
  d_ff x6(w2[1],q_bar[5], d_in[2], a_reset, a_reset, ~d1, clk);
  d_ff x7(w1[1],q_bar[6], d_in[1], a_reset, a_reset, ~d1, clk);
  d_ff x8(w0[1],q_bar[7], d_in[0], a_reset, a_reset, ~d1, clk);
  
  d_ff x9(w3[2],q_bar[8], d_in[3], a_reset, a_reset, ~d2, clk);
  d_ff x10(w2[2],q_bar[9], d_in[2], a_reset, a_reset, ~d2, clk);
  d_ff x11(w1[2],q_bar[10], d_in[1], a_reset, a_reset, ~d2, clk);
  d_ff x12(w0[2],q_bar[11], d_in[0], a_reset, a_reset, ~d2, clk);
  
  d_ff x13(w3[3],q_bar[12], d_in[3], a_reset, a_reset, ~d3, clk);
  d_ff x14(w2[3],q_bar[13], d_in[2], a_reset, a_reset, ~d3, clk);
  d_ff x15(w1[3],q_bar[14], d_in[1], a_reset, a_reset, ~d3, clk);
  d_ff x16(w0[3],q_bar[15], d_in[0], a_reset, a_reset, ~d3, clk);
  
  d_ff x17(w3[4],q_bar[16], d_in[3], a_reset, a_reset, ~d4, clk);
  d_ff x18(w2[4],q_bar[17], d_in[2], a_reset, a_reset, ~d4, clk);
  d_ff x19(w1[4],q_bar[18], d_in[1], a_reset, a_reset, ~d4, clk);
  d_ff x20(w0[4],q_bar[19], d_in[0], a_reset, a_reset, ~d4, clk);
  
  d_ff x21(w3[5],q_bar[20], d_in[3], a_reset, a_reset, ~d5, clk);
  d_ff x22(w2[5],q_bar[21], d_in[2], a_reset, a_reset, ~d5, clk);
  d_ff x23(w1[5],q_bar[22], d_in[1], a_reset, a_reset, ~d5, clk);
  d_ff x24(w0[5],q_bar[23], d_in[0], a_reset, a_reset, ~d5, clk);

  d_ff x25(w3[6],q_bar[24], d_in[3], a_reset, a_reset, ~d6, clk);
  d_ff x26(w2[6],q_bar[25], d_in[2], a_reset, a_reset, ~d6, clk);
  d_ff x27(w1[6],q_bar[26], d_in[1], a_reset, a_reset, ~d6, clk);
  d_ff x28(w0[6],q_bar[27], d_in[0], a_reset, a_reset, ~d6, clk);
  
  d_ff x29(w3[7],q_bar[28], d_in[3], a_reset, a_reset, ~d7, clk);
  d_ff x30(w2[7],q_bar[29], d_in[2], a_reset, a_reset, ~d7, clk);
  d_ff x31(w1[7],q_bar[30], d_in[1], a_reset, a_reset, ~d7, clk);
  d_ff x32(w0[7],q_bar[31], d_in[0], a_reset, a_reset, ~d7, clk);

  //4 8:1 mux's
  mux_8_1_structural o1(d_out[3], w3, a_in);
  mux_8_1_structural o2(d_out[2], w2, a_in);
  mux_8_1_structural o3(d_out[1], w1, a_in);
  mux_8_1_structural o4(d_out[0], w0, a_in);
  
endmodule
  