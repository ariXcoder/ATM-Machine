`timescale 1ns / 1ps


module slowed_clock(
input clk, // THIS IS THE 100MHZ clock from the BASYS-3
output clk_out // This is the slowed clock of 100 Hz
    );
    
reg [20:0] count=0;    
reg clk_slowed;
always@(posedge clk)begin
    count<=count+1;
    if(count==500_000)begin          // [ 5*10^5 * (10*10^-9) ]*2 (2 for rise and fall of clk] -> 10^-2 sec
                                     // 10^-2 sec = 100 Hz
        clk_slowed=~clk_slowed;
        count<=0;
    end
end
assign clk_out=clk_slowed;
endmodule
