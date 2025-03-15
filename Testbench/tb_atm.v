`timescale 1ns / 1ps


module tb_atm();
reg clk,res; 
reg with_en,dep_en;
reg [5:0] data_in;
wire [6:0] balance;
wire max_bal,min_bal,double_currency;

atm ATM_machine(.clk(clk),.res(res),.with(with_en),.dep(dep_en),.data_in(data_in),.seg_balance(balance),.max_bal(max_bal),.min_bal(min_bal),.mul_swtich(double_currency));

initial begin
clk<=0; res<=1; with_en<=0; dep_en<=0; data_in<=6'b000001;
end
always #5 clk<=~clk;

initial begin
#5 res<=1;
#10 dep_en<=1; data_in<=6'b010000;
#10 data_in<=6'b100000;
#5 res<=0;

#20 $finish;
end

endmodule
