`timescale 1ns / 1ps
 
 // 2-BIT COUNTER required for turning each 7 segment display out of 3 one 
 // by one )
module counter(
    input clk, // this is the slowed 100hz clock
    output [7:0] out
    );
    
    reg [7:0] count=0;
    always@(posedge clk)begin
        count<=count+1;
    end
    assign out=count;
endmodule
