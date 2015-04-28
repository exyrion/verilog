//Justin Liang
//ECE 154A
//Homework 1, Problem 1a

module mux_8_1(in, out, s);
  output out;
  input [7:0] in;
  input [2:0] s;
  
  reg out;
  
  //Whenever the select values or the input changes, change the outputs
  always@(s or in)
  begin
    case(s)
      3'b000: out <= in[0];
      3'b001: out <= in[1];
      3'b010: out <= in[2];
      3'b011: out <= in[3];
      3'b100: out <= in[4];
      3'b101: out <= in[5];
      3'b110: out <= in[6];
      3'b111: out <= in[7];
    endcase
  end
endmodule