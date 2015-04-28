// Justin Liang
// ECE 154A

module mux_8_1_structural(out, in, s);
  output out;
  input [7:0] in;
  input [2:0] s;
  
  //Created the inverse of input by notting them
  wire not2, not1, not0;  
  not(not2, in[2]);
  not(not1, in[1]);
  not(not0, in[0]);
  
  //Implemented the boolean equation for a multiplexer
  wire a, b, c, d, e, f, g, h;
  and(a, not2, not1, not0);
  and(b, not2, not1, s[0]);
  and(c, not2, s[1], not0);
  and(d, not2, s[1], s[0]);
  and(e, s[2], not1, not0);
  and(f, s[2], not1, s[0]);
  and(g, s[2], s[1], not0);
  and(h, s[2], s[1], s[0]);
  or(out, a, b, c, d, e, f, g, h);

endmodule
