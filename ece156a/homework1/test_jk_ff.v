//Justin Liang
//ECE 154A
//JK ff testbench

module test_jk_ff();
  
  reg j;
  reg k;
  reg a_reset;
  reg reset;
  reg enable;
  reg clk;
  wire q, q_bar;  
  
  jk_ff testing(q, q_bar, j, k, a_reset, reset, enable, clk);
  //jk_ff_structural testing(q, q_bar, j, k, a_reset, reset, enable, clk);
  
  initial begin
    //Initial parameters
    clk = 0;
    reset = 1;
    a_reset = 1;
    enable = 1;
    #200
    
    //Testing j = 0, k = 0
    j = 0;
    k = 0;
    #100
    
    //Testing j = 0, k = 1
    j = 0;
    k = 1;
    #100
    
    //Testing j = 1, k = 0
    j = 1;
    k = 0;
    #100
    
    //Testing j = 1, k = 1
    j = 1;
    k = 1;
    #100
    
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
  
endmodule



