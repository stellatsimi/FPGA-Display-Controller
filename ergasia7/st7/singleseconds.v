`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:20 09/09/2024 
// Design Name: 
// Module Name:    singleseconds 
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
module singleseconds (reset, clk, enable, ss, nxt);
  input reset, clk, enable;
  output [3:0] ss;
  output       nxt;
  reg    [3:0] ss;
  
  assign nxt= (ss == 4'd9);
  always @(posedge clk or posedge reset)
    if (reset) ss <= 4'd0;
      else if (enable)
             if (nxt) ss <= 0;
               else ss <= ss + 1;
endmodule



module tenthsofseconds (reset, clk, enable, ts);
  input reset, clk, enable;
  output [2:0] ts;
  wire         again;
  reg    [2:0] ts;
  
  assign again = (ts == 3'd5);
  always @(posedge clk or posedge reset)
    if (reset) ts <= 4'd0;
      else if (enable)
             if (again) ts <= 0;
               else ts <= ts + 1;
endmodule


module secondcounter (
    input reset, 
    input clk, 
    input enable, 
    input pause, 
    output reg [2:0] ts, 
    output reg [3:0] ss 
);
    wire ent;
    
    reg [3:0] ss_saved;
    reg [2:0] ts_saved;

    reg pause_state; 
    
    wire [3:0] ss_internal;
    wire [2:0] ts_internal;

    singleseconds i0 (
        .reset(reset),
        .clk(clk),
        .enable(enable),
        .ss(ss_internal), 
        .nxt(ent) 
    );
  
   
    tenthsofseconds i1 (
        .reset(reset),
        .clk(clk),
        .enable(enable & ent), 
        .ts(ts_internal) 
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ts <= 3'd0;
            ss <= 4'd0;
            ts_saved <= 3'd0;
            ss_saved <= 4'd0;
            pause_state <= 0; 
        end else begin
            if (pause && ~pause_state) begin
                ts_saved <= ts_internal;
                ss_saved <= ss_internal; 
                ts <= ts_saved; 
                ss <= ss_saved;
                pause_state <= 1; 
            end else if (~pause && pause_state) begin
                ts <= ts_internal; 
                ss <= ss_internal;
                pause_state <= 0; 
            end else if (~pause) begin
                ts <= ts_internal;
                ss <= ss_internal;
            end
        end
    end
endmodule
