`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:01 09/09/2024 
// Design Name: 
// Module Name:    tops 
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
module tops (
    input reset, 
    input clk, 
    input pause,           
    output [6:0] left, 
    output [6:0] right
);
    wire [2:0] ts;
    wire [3:0] ss;
    wire en_nxt;

    OneHertz i0 (
        .reset(reset),
        .clk(clk),
        .en_nxt(en_nxt)
    );
  
    secondcounter i1 (
        .reset(reset),
        .clk(clk),
        .enable(en_nxt),
        .pause(pause),    
        .ts(ts),
        .ss(ss)
    );
  
    bin_2_7 lt (
        .x({1'b0, ts}), 
        .s(left)
    );
  
    bin_2_7 rt (
        .x(ss), 
        .s(right)
    );
endmodule

