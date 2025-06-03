`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:11 09/05/2024 
// Design Name: 
// Module Name:    color_memory 
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

module color_memory(
    input clock,
    input reset,
    input r,
    input g,
    input b,
    input [2:0] window_select,
	 input [9:0] hcounter,
	 input [8:0] vcounter,
    output reg [2:0] red_out,
    output reg [2:0] green_out,
    output reg [2:0] blue_out
);

    parameter NUM_WINDOWS = 6;
    reg [2:0] color_memory[NUM_WINDOWS-1:0][2:0]; // Memory to store RGB values for each window
    reg red_dir[NUM_WINDOWS-1:0];   // Direction flags for red 
    reg green_dir[NUM_WINDOWS-1:0]; // Direction flags for green
    reg blue_dir[NUM_WINDOWS-1:0];  // Direction flags for blue 
	
	
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
	
	
	
	integer i;
	 
	 
	 
    always @(posedge clock or posedge reset)  begin
        if (reset) begin
            for (i = 0; i < NUM_WINDOWS; i = i + 1) begin
                color_memory[i][0] <= 3'd0; // Red
                color_memory[i][1] <= 3'd0; // Green
                color_memory[i][2] <= 3'd0; // Blue
                red_dir[i] <= 1'b1;   
                green_dir[i] <= 1'b1;
                blue_dir[i] <= 1'b1;  
            end
        end else begin
            // Update red component
            if (r) begin
                if (red_dir[window_select]) begin
                    if (color_memory[window_select][0] < 3'd7)
                        color_memory[window_select][0] <= color_memory[window_select][0] + 1;
                    else
                        red_dir[window_select] <= 1'b0; 
                end else begin
                    if (color_memory[window_select][0] > 3'd0)
                        color_memory[window_select][0] <= color_memory[window_select][0] - 1;
                    else
                        red_dir[window_select] <= 1'b1; 
                end
            end

            // Update green component
            if (g) begin
                if (green_dir[window_select]) begin
                    if (color_memory[window_select][1] < 3'd7)
                        color_memory[window_select][1] <= color_memory[window_select][1] + 1;
                    else
                        green_dir[window_select] <= 1'b0; 
                end else begin
                    if (color_memory[window_select][1] > 3'd0)
                        color_memory[window_select][1] <= color_memory[window_select][1] - 1;
                    else
                        green_dir[window_select] <= 1'b1; 
                end
            end

            // Update blue component
            if (b) begin
                if (blue_dir[window_select]) begin
                    if (color_memory[window_select][2] < 3'd7)
                        color_memory[window_select][2] <= color_memory[window_select][2] + 1;
                    else
                        blue_dir[window_select] <= 1'b0; 
                end else begin
                    if (color_memory[window_select][2] > 3'd0)
                        color_memory[window_select][2] <= color_memory[window_select][2] - 1;
                    else
                        blue_dir[window_select] <= 1'b1; 
                end
            end
        end
    end



always @(posedge clock)
begin 
	
	if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH || hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH)
		{red_out, green_out, blue_out} <= 9'o000;
	else
	begin
	
		if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 200) // upper
		
			if(hcounter < (H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 213)) // window 1
				if(window_select == 3'd0)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 5)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 194)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 5)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 207)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[0][0];
						green_out <= color_memory[0][1];
						blue_out <= color_memory[0][2];
					end else begin
						red_out <= color_memory[0][0];
						green_out <= color_memory[0][1];
						blue_out <= color_memory[0][2];
					end
			else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 426) // window 2
				if(window_select == 3'd1)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 5)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 194)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 218)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 420)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[1][0];
						green_out <= color_memory[1][1];
						blue_out <= color_memory[1][2];
					end else begin
						red_out <= color_memory[1][0];
						green_out <= color_memory[1][1];
						blue_out <= color_memory[1][2];
					end
			else // window 3
				if(window_select == 3'd2)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 5)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 194)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 431)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 634)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[2][0];
						green_out <= color_memory[2][1];
						blue_out <= color_memory[2][2];
					end else begin
						red_out <= color_memory[2][0];
						green_out <= color_memory[2][1];
						blue_out <= color_memory[2][2];
					end
		else // lower
			
			if(hcounter < (H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 213)) // window 4
				if(window_select == 3'd3)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 205)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 394)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 5)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 207)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[3][0];
						green_out <= color_memory[3][1];
						blue_out <= color_memory[3][2];
					end else begin
						red_out <= color_memory[3][0];
						green_out <= color_memory[3][1];
						blue_out <= color_memory[3][2];
					end
			else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 426) // window 5
				if(window_select == 3'd4)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 205)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 394)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 218)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 420)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[4][0];
						green_out <= color_memory[4][1];
						blue_out <= color_memory[4][2];
					end else begin
						red_out <= color_memory[4][0];
						green_out <= color_memory[4][1];
						blue_out <= color_memory[4][2];
					end
			else // window 6
				if(window_select == 3'd5)
					if(vcounter < V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 205)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(vcounter > V_BACK_PORCH +V_SYNC_PULSE+ V_FRONT_PORCH + 394)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter < H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 431)
						{red_out, green_out, blue_out} <= 9'o770;
					else if(hcounter > H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH + 634)
						{red_out, green_out, blue_out} <= 9'o770;
					else begin
						red_out <= color_memory[5][0];
						green_out <= color_memory[5][1];
						blue_out <= color_memory[5][2];
					end else begin
						red_out <= color_memory[5][0];
						green_out <= color_memory[5][1];
						blue_out <= color_memory[5][2];
					end
	
	
	end
		
end	
endmodule
