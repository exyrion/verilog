//Justin Liang
//ECE 154A
//Homework 1

module d_ff(q, q_bar, d, a_reset, reset, enable, clk);
  output q, q_bar;
  input  d, a_reset, reset, enable, clk;
  reg q, q_bar;
   
  always @ (posedge clk or negedge a_reset)
    if(~reset || ~a_reset) begin
      q <= 0;
      q_bar <= 1;
    end
    else if(~enable) begin
      q <= d;
      q_bar <= ~d;
    end
endmodule