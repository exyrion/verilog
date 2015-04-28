//Justin Liang
//ECE 156A
//Homework 5

module upcnt ( clk, enable, reset, count );
  output [3:0] count;
  input clk, enable, reset;
  wire   n1, n3, n5, n7, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29;

  FD2 \count_reg[0]  ( .D(n20), .CP(clk), .CD(n1), .Q(count[0]), .QN(n7) );
  FD2 \count_reg[2]  ( .D(n17), .CP(clk), .CD(n1), .Q(count[2]), .QN(n5) );
  FD2 \count_reg[1]  ( .D(n18), .CP(clk), .CD(n1), .Q(count[1]) );
  FD2 \count_reg[3]  ( .D(n19), .CP(clk), .CD(n1), .Q(count[3]), .QN(n3) );
  EO U18 ( .A(n21), .B(n7), .Z(n20) );
  AO7 U19 ( .A(n22), .B(n3), .C(enable), .Z(n21) );
  NR2 U20 ( .A(count[1]), .B(count[2]), .Z(n22) );
  AO7 U21 ( .A(n23), .B(n24), .C(n3), .Z(n19) );
  ND2 U22 ( .A(count[2]), .B(count[1]), .Z(n24) );
  IV U23 ( .A(n25), .Z(n23) );
  MUX21L U24 ( .A(n26), .B(n27), .S(count[1]), .Z(n18) );
  AO6 U25 ( .A(n25), .B(n5), .C(n27), .Z(n26) );
  EO U26 ( .A(n5), .B(n28), .Z(n17) );
  ND2 U27 ( .A(n27), .B(count[1]), .Z(n28) );
  AN2 U28 ( .A(n3), .B(n25), .Z(n27) );
  NR2 U29 ( .A(n29), .B(n7), .Z(n25) );
  IV U30 ( .A(enable), .Z(n29) );
  IV U31 ( .A(reset), .Z(n1) );
endmodule