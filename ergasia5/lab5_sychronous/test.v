module testbench;

reg clock;
reg clear;
reg load;
reg start_stop;
reg [7:0] data;
wire [7:0] count;

counter_8bit uut (
    .clear(clear),
    .clock(clock),
    .load(load),
    .start_stop(start_stop),
    .count(count),
    .data(data)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    clear = 1;
    load = 0;
    start_stop = 0;
    data = 8'b0;

    #10 clear = 0;
    #10 begin
        load = 1;  
        data = 8'd18; 
    end
    #10 load = 0; 
    #100 start_stop = 1; 
    #200 start_stop = 0; 
    #200 start_stop = 1; 
    #200 clear = 1; 
    #100;
    $finish; 
end
initial begin
	$monitor("clear = %b, clock = %b, load = %b, start_stop = %b, data = %d, count = %d",
	clear,clock,load,start_stop,data,count);
end
endmodule