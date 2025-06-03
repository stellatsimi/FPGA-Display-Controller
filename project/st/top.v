`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:03 09/05/2024 
// Design Name: 
// Module Name:    top 
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

module top(reset,clk,ps2clk,ps2data,hsync,vsync,red_out, green_out, blue_out);input reset,clk;input ps2clk,ps2data;output hsync,vsync;output [2:0] red_out, green_out, blue_out;


wire [7:0]scancode;wire clkdiv4,reset,flag;wire r,g,b;
wire [2:0] window_select;
wire [9:0] hcounter;
wire [8:0] vcounter;


pixel_clk pix (clk,reset,clkdiv4);
kbd_protocol kbdp (reset, clkdiv4, ps2clk, ps2data, scancode,flag);
scancode_decoder kbdd (clkdiv4,reset,flag,scancode,r,g,b,window_select);
 
vgasync syn (clkdiv4,reset,hsync,vsync,hcounter, vcounter);

color_memory cm(clkdiv4,reset,r,g,b,window_select,hcounter,vcounter,red_out,green_out,blue_out);
      endmodule 