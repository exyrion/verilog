//Justin Liang
//ECE 154A
//DFF Testbench

module test_d_ff();
  
  reg d;
  reg a_reset;
  reg reset;
  reg enable;
  reg clk;
  wire q, q_bar;  
  
  d_ff testing(q, q_bar, d, a_reset, reset, enable, clk);
  //d_ff_structural testing(q, q_bar, d, a_reset, reset, enable, clk);
  
  initial begin
    //Initial parameters
    clk = 0;
    reset = 1;
    a_reset = 1;
    enable = 1;
    d = 1;
    #200
    
    //Testing reset 
    reset = 0;
    a_reset = 1;
    enable = 1;
    #100
    
    //Testing a_reset
    reset = 1;
    a_reset = 0;
    enable = 1;
    #100
    
    //Testing enable
    reset = 1;
    a_reset = 1;
    enable = 0;
  end
  
  //Clock
  always begin
    #30 clk = ~clk;
  end
  
  //Testing data
  //Has a different time interval of change compared to clock to check for a_reset and reset
  always begin
    #50 d = ~d;
  end
  
endmodule


