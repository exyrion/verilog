module test_taillights(); 
reg  L, R, H, B, Rst, CLK;
wire [5:0] y; 
initial begin 
  CLK = 1;
  L = 0; 
  R = 0; 
  H = 0; 
  B = 0;
  Rst = 0;
  
  //brake
  #1000 L = 0;
  #0 R = 0;
  #0 H = 0;
  #0 B = 1;
  //hazard
  #1000 L = 0;
  #0 R = 0;
  #0 H = 1;
  #0 B = 0;
  //brake
  #1000 L = 0;
  #0 R = 0;
  #0 H = 1;
  #0 B = 1;
  //TR
  #1000 L = 0;
  #0 R = 1;
  #0 H = 0;
  #0 B = 0;
  //TR & brake
  #1000 L = 0;
  #0 R = 1;
  #0 H = 0;
  #0 B = 1;
  //hazard
  #1000 L = 0;
  #0 R = 1;
  #0 H = 1;
  #0 B = 0;
  //TR & brake
  #1000 L = 0;
  #0 R = 1;
  #0 H = 1;
  #0 B = 1;
  //TL
  #1000 L = 1;
  #0 R = 0;
  #0 H = 0;
  #0 B = 0;
  //TL & brake
  #1000 L = 1;
  #0 R = 0;
  #0 H = 0;
  #0 B = 1;
  //hazard
  #1000 L = 1;
  #0 R = 0;
  #0 H = 1;
  #0 B = 0;
  //TL & brake
  #1000 L = 1;
  #0 R = 0;
  #0 H = 1;
  #0 B = 1;
  //hazard
  #1000 L = 1;
  #0 R = 1;
  #0 H = 0;
  #0 B = 0;
  //brake
  #1000 L = 1;
  #0 R = 1;
  #0 H = 0;
  #0 B = 1;
  //hazard
  #1000 L = 1;
  #0 R = 1;
  #0 H = 1;
  #0 B = 0;
  //brake
  #1000 L = 1;
  #0 R = 1;
  #0 H = 1;
  #0 B = 1;
  
  //reset
  #1000 Rst = 1;
end 
 
always begin 
#100 CLK = ~CLK; 
end 

/*
always begin
#50 DIMCLK = ~DIMCLK;
end*/
 
lights G1(L, R, H, B, Rst, CLK, y); 
 
endmodule
