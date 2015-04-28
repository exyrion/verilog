`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:47 03/06/2013 
// Design Name: 
// Module Name:    lights 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lights(L, R, H, B, Rst, CLK, y, yout, Lights, DIMCLK);
	input L, R, H, B, Rst, CLK, Lights, DIMCLK;
	output [5:0] y, yout; 
	reg [5:0] y, y_next;
	parameter off = 6'b000000, on = 6'b111111, 
				 l1 = 6'b001000, l2 = 6'b011000, l3 = 6'b111000, 
				 r1 = 6'b000100, r2 = 6'b000110, r3 = 6'b000111,
				 bl1 = 6'b001111, bl2 = 6'b011111, 
				 br1 = 6'b111100, br2 = 6'b111110;			
	
	//flip flop logic
	always @(posedge CLK)
		if (Rst)
			y <= off;
		else
			y <= y_next;
	
	//next stage logic
	always @(y or L or R or H or B)
		case (y)
			off: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;
				else
					y_next <= off; // do nothing
				
			on: 
				if ((L && R && B) || (!L && !R && B)) // still brake; 11X1, 00X1
					y_next <= on;
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;
				else 
					y_next <= off; // hazard, off
					
			l1: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // second turn left; 1000
					y_next <= l2;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and second turn left; 10X1
					y_next <= bl2;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;
				else
					y_next <= off; // off
				
			l2: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // third turn left; 1000
					y_next <= l3;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and third turn left; 10X1
					y_next <= on;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;
				else
					y_next <= off; // off
			
			l3:
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and reset turn left; 10X1
					y_next <= r3;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= br1;
				else
					y_next <= off; // reset turn left, off
			
			r1: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (!L && R && !H && !B) // second turn right; 0100
					y_next <= r2;
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && B) // brake and second turn right; 01X1
					y_next <= br2;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;
				else
					y_next <= off; // off
				
			r2: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (!L && R && !H && !B) // third turn right; 0100
					y_next <= r3;
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && B) // brake and third turn right; 01X1
					y_next <= on;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;
				else
					y_next <= off; // off
			
			r3:
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && B) // brake and reset turn right; 01X1;
					y_next <= l3;
				else if (L && !R && B) // brake and first turn left; 10X1;
					y_next <= bl1;
				else
					y_next <= off; // reset turn right, off
					
			
			bl1: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // second turn left; 1000
					y_next <= l2;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and second turn left; 10X1
					y_next <= bl2;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;	
				else
					y_next <= off; // off
					
			bl2: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (L && !R && !H && !B) // third turn left; 1000
					y_next <= l3;
				else if (!L && R && !H && !B) // first turn right; 0100
					y_next <= r1;
				else if (L && !R && B) // brake and third turn left; 10X1
					y_next <= on;
				else if (!L && R && B) // brake and first turn right; 01X1
					y_next <= l3;	
				else
					y_next <= off; // off	
			
					
			br1: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (!L && R && !H && !B) // second turn right; 0100
					y_next <= r2;
				else if (L && !R && !H && !B) // first turn left; 0111
					y_next <= l1;
				else if (!L && R && B) // brake and second turn right; 01X1
					y_next <= br2;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;	
				else
					y_next <= off; // off
					
			br2: 
				if ((L && R) || (!L && !R && B) || (H && !B)) // brake, hazard; 11XX, 00X1, XX10
					y_next <= on; 
				else if (!L && R && !H && !B) // third turn right; 0100
					y_next <= r3;
				else if (L && !R && !H && !B) // first turn left; 1000
					y_next <= l1;
				else if (!L && R && B) // brake and third turn right; 01X1
					y_next <= on;
				else if (L && !R && B) // brake and first turn left; 10X1
					y_next <= r3;	
				else
					y_next <= off; // off	

    default: y_next <= off;

		endcase
	
	assign yout[0] = (Lights && DIMCLK) || y[0];
	assign yout[1] = (Lights && DIMCLK) || y[1];
	assign yout[2] = (Lights && DIMCLK) || y[2];
	assign yout[3] = (Lights && DIMCLK) || y[3];
	assign yout[4] = (Lights && DIMCLK) || y[4];
	assign yout[5] = (Lights && DIMCLK) || y[5];
	
	
endmodule
