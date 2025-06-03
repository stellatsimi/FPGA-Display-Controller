`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:05 09/05/2024 
// Design Name: 
// Module Name:    pixel_clk 
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
module pixel_clk(clk,reset,clkdiv4);
input clk, reset;
output clkdiv4;
reg [1:0] count;
assign clkdiv4=(count==2'd3);
always@(posedge clk or posedge reset)
begin
    if (reset) count<=2'd0;
    else 
    begin
        if (count==2'd3) count<=2'd0;   
        else        count<=count+1;
    end
end
endmodule