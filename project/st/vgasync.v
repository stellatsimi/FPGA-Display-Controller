`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:08 09/05/2024 
// Design Name: 
// Module Name:    vgasync 
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
module vgasync(
    input vga_clk,
    input reset,
    output reg hsync,
    output reg vsync,
    output reg [9:0] hcounter,
    output reg [8:0] vcounter
);


parameter H_FRONT_PORCH = 16;
parameter H_SYNC_PULSE = 96;
parameter H_BACK_PORCH = 48;
parameter H_VISIBLE_AREA = 640;
parameter H_TOTAL = H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + H_VISIBLE_AREA;

parameter V_FRONT_PORCH = 12;
parameter V_SYNC_PULSE = 2;
parameter V_BACK_PORCH = 35;
parameter V_VISIBLE_AREA = 400;
parameter V_TOTAL = V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH + V_VISIBLE_AREA;


always @(posedge vga_clk or posedge reset) begin
    if (reset) begin
        hcounter <= 10'd0;
        vcounter <= 9'd0;
    end 
    else if (hcounter == H_TOTAL - 1)
         begin
            hcounter <= 10'd0;
            if (vcounter == V_TOTAL - 1) vcounter <= 9'd0;
            else vcounter <= vcounter + 9'd1;
        end 
        else  hcounter <= hcounter + 10'd1;
    end


always @(posedge vga_clk) begin
    hsync <= (hcounter >= H_FRONT_PORCH && hcounter < H_FRONT_PORCH + H_SYNC_PULSE) ? 0 : 1;
    vsync <= (vcounter >= V_FRONT_PORCH && vcounter < V_FRONT_PORCH + V_SYNC_PULSE) ? 1: 0;
end

endmodule


