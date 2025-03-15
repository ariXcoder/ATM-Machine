`timescale 1ns / 1ps
 

module double_currency(
  input [5:0] data_in,
  output reg mul_switch,
  output reg [6:0] price
    );
    
    parameter p0=6'd1,p1=6'd2,p2=6'd4,p3=6'd8, p4=6'd16, p5=6'd32;

always @(*) begin

    case(data_in)
        6'b000001:mul_switch<=0;
        6'b000010:mul_switch<=0;
        6'b000100:mul_switch<=0;
        6'b001000:mul_switch<=0;
        6'b010000:mul_switch<=0;
        6'b100000:mul_switch<=0;
        6'b000000:mul_switch<=0;
        default:mul_switch<=1;
    
    endcase
 end 
always @(*) begin
    if (data_in == p1) 
        price <= 7'b0000101;   // 5rs.
    else if (data_in == p2)  
        price <= 7'b0001010;   // 10rs.
    else if (data_in == p3)                                    // PRICE ASSIGNMENT
        price <= 7'b0010100;   // 20rs.
    else if (data_in == p4) 
        price <= 7'b0110010;   // 50rs.
    else if (data_in == p5) 
        price <= 7'b1100100;   // 100rs.
    else if (data_in == p0)  
        price <= 7'b0001010;   // 10rs.
    else 
        price <= 7'b0;        // 0 rs. i.e all switches OFF
end 
  
    
endmodule
