`timescale 1ns / 1ps

module decoder(
    input [1:0] en,
    output reg [3:0] an
    ); 
    
    always@(en)begin
    case(en)
        0:an=4'b1110; // rightmost LED is ON
        1:an=4'b1101; // 2nd LED from right is ON
        2:an=4'b1011;// 3rd LED from right is ON
        3:an=4'b1111; // All LEDs are OFF
         
    endcase 
    end
endmodule
