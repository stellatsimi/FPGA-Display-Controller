module counter_8bit(clear,clock,load,start_stop,count,data);
input [7:0] data;
output wire [7:0] count;
input start_stop;
input load;
input clock;
input clear;

counter counter_low(.clear(clear), .clock(clock), .load(load), .start_stop(start_stop),.data(data[3:0]), .count(count[3:0]));
counter counter_high(.clear(clear), .clock(clock), .load(load), .start_stop(start_stop && (count[3:0] == 4'b1111)),.data(data[7:4]), .count(count[7:4]));

endmodule
