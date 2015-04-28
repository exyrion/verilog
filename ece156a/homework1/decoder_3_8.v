//Justin Liang
//ECE 154A
//Homework 1, Problem 1b

module decoder_3_8(in, out);
  input[2:0] in;
  output[7:0] out;

  reg[7:0] out;
  
  //Whenever input changes, change the output
  always@(in)
  begin
    case(in)
      3'b000: out <= 8'b00000001;
      3'b001: out <= 8'b00000010;
      3'b010: out <= 8'b00000100;
      3'b011: out <= 8'b00001000;
      3'b100: out <= 8'b00010000;
      3'b101: out <= 8'b00100000;
      3'b110: out <= 8'b01000000;
      3'b111: out <= 8'b10000000;
    endcase
  end
endmodule
    
