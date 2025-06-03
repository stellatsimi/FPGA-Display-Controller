`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:17 09/05/2024 
// Design Name: 
// Module Name:    scancode_decoder 
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
module scancode_decoder(clock,reset,flag,scancode,r,g,b,window_select);
input [7:0] scancode;
input flag,clock,reset;
output reg r,g,b;
output reg [2:0] window_select;


always @(posedge clock or posedge reset) 
if (reset)
begin
    r<=0;
    g<=0;
    b<=0;	
    window_select<=3'd6;
end
else begin
    r<=0;
    g<=0;
    b<=0;

if(flag)
begin
    case(scancode)
        8'h16: begin //found 1 
               window_select <=3'd0; 
					end
        8'h1e: begin //found 2
					window_select<=3'd1;
					end					
        8'h26: begin //found 3
					window_select<=3'd2;
					end
        8'h25: begin //found 4 
					window_select<=3'd3;
					end
	8'h2e: begin //found 5		
					window_select<=3'd4;
					end
					
	8'h36: begin //found 6
					window_select<=3'd5;
					end
	8'h76: begin // found escape
				window_select<=3'd6;
					end
        8'h2d: r<=1'b1; //found red
        8'h34: g<=1'b1; //found green
        8'h32: b<=1'b1; //found blue
    endcase
	 
	 
end
else 
    begin
    r<=0;
    g<=0;
    b<=0;
    end
end
endmodule