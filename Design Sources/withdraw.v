`timescale 1ns / 1ps


module withdraw(
    input with_en,
    input clk,
    input res,
    output count_down
    );
reg current_count;
parameter s0=2'b00,s1=2'b01;
reg flag=1;
reg current_state,next_state;
always@(posedge clk or posedge res)begin
     if(res)    current_state<=s0;
     else       current_state<=next_state;
end

always@(current_state,with_en)begin
    case(current_state)
    s0:begin
        if(with_en)  next_state=s1;
        else        next_state=s0;
    
    end
    s1:
        next_state=s0;
    default:next_state=s0;
    endcase
      
end

always@(current_state)begin
    case(current_state)
    s0:begin
        flag=0;
    end
    s1: begin
        flag=1;
    end
    default:begin
        flag=0;
    end
    endcase
 
end
assign count_down=flag;


endmodule
