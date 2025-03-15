`timescale 1ns / 1ps
 
module binary_to_bcd(    
    input [7:0] bal,
    input res,
    output [11:0] bcd
);

reg [19:0] bal1;
always@(*)begin
    bal1={12'b000000000000,bal};     
end

integer i;

reg [2:0] in=3'b000;

always@(*)begin
   
        for(i=0;i<8;i=i+1)begin
            
            if(bal1[11:8] >3'b100) bal1[11:8]=bal1[11:8]+3'b011;
           
            if(bal1[15:12] >3'b100) bal1[15:12]=bal1[15:12]+3'b011;
            
            if(bal1[19:16] >3'b100) bal1[19:16]=bal1[19:16]+3'b011;          
            
            bal1=bal1<<1;
        
end // for loop ka

   
  
end // always ka


 assign bcd= (res) ? 12'b000000000000 : bal1[19:8]; 

endmodule
