`timescale 1ns / 1ps

module tb_debounce();
reg clk;
reg en;
wire op_clk;

debounce deb(.clk(clk),.en(en),.op_clk(op_clk));

initial begin
clk<=0; en<=0;
end

always #5 clk<=~clk;

initial begin
 #1000 en<=1; 
 #10000000 en<=0;
#500000000 en<=1;
#10 $finish;
end
endmodule
