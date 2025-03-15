`timescale 1ns / 1ps
 

module balance(
input clk,res,with_en,dep_en ,
input [6:0] price,
output  [7:0] balance,
output  max_bal,min_bal 
);

reg [7:0] current_balance;
reg led1; // max balance
reg led2; // min balance
/// this always is for balance update
always@(posedge clk or posedge res)begin
    if(res) current_balance<=8'b00000000;
    else if(dep_en && (balance+price)>balance) begin                             
        current_balance<=balance+price;  
    end
    else if(with_en && price<balance)begin
        current_balance<=balance-price;
    end
end

assign balance=current_balance;


// this always is for max_bal LED 
always@(posedge clk or posedge res) begin
    if(res)
        led1<=0;
    else if(dep_en && (balance+price)<balance ) // overflow case
        led1<=1;
    else if(dep_en && (balance+price)>balance )
        led1<=0;
    else if(with_en && (price)<balance )
        led1<=0;
    else
        led1<=max_bal;                  
end

assign max_bal=led1;

// this always is for min_bal LED 
always@(posedge clk or posedge res) begin
    if(res)
        led2<=0;
    else if(with_en && (price)>balance )  // underflow case
        led2<=1;
    else if(with_en && (price)<balance )
        led2<=0;
    else if(dep_en && (balance+price)>balance )
        led2<=0;
    else
        led2<=min_bal;                  
end

assign min_bal=led2;

endmodule
