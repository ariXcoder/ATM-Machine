`timescale 1ns / 1ps


module debounce(en,clk,op_clk);
input clk; 
input en;
output reg op_clk;

reg unsigned [22:0] counter ={23{1'b0}};

always@(posedge clk) begin
    if(en==0)begin                                         //NOTE: Push buttons are logic 0 on pressing
            if(counter<24'h4C4B3F)begin
                op_clk<=1'b0;
                counter<=counter+1'b1;
            end
            else if(counter==24'h4C4B3F)begin         // 24'h4C4B3F equivalent to 4999999 which is 50ms 
                op_clk<=1'b1;
                counter<=counter+1'b1;                 // getting peak of reset at 50ms after that zero
            end
            else if(counter>24'h4C4B3F) begin
                op_clk<=1'b0;
                
        end     
    end
    else begin
        counter<={23{1'b0}};
        op_clk<=1'b0;
    end

end
endmodule
