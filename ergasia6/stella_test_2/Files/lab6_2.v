`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:34 04/19/2024 
// Design Name: 
// Module Name:    lab6_2 
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
module multi2 (a, b, c, d, s, dp);
  input a, b, c, d;
  output [6:0] s;
  output dp;
  wire [3:0] mult_out;
  
  assign mult_out = {a, b} * {c,d};
  
  


  assign s[6:0] = mult_out == 4'b0000 ? 7'b1110111 : //0
                 (mult_out == 4'b0001 || mult_out == 4'b1111)? 7'b0010010 : //1 -1
                  mult_out == 4'b0100 ? 7'b0111010 : //4
                                        7'b1011101;  //-2 -2
  
  
  assign dp = mult_out[3] ? 1 :
                            0 ;
               
endmodule