`timescale 1ns / 1ps


module atm(input clk,res,
input [5:0] data_in,  // for 6 switches for currencies : 1$, 5$ , 10$, 20$, 50$, 100$
input with,
input dep,
output [6:0] seg_balance,
output [3:0] an,
output max_bal,min_bal,
output mul_switch
);


 
wire [6:0] price;
wire with_en,dep_en;
wire res_en;

debounce D1(with,clk,with_en);
debounce D2(dep,clk,dep_en);
debounce D3(res,clk,res_en);

wire mul;
wire [7:0] balance; // output of main balance instantiation , to be sent further for bcd conversion
wire [20:0] bcd_balance; // output of 
wire[11:0] bcd;
wire [3:0] bcd_to_seg; // going to bcd to 7 segment display 
wire [1:0] select_line; // select line for 4:1 mux coming from 2-BIT COUNTER
wire slowed_clock ; //100 Hz clock
wire increment,decrement;
double_currency DC(.data_in(data_in),.mul_switch(mul_switch),.price(price));

slowed_clock SC(.clk(clk),.clk_out(slowed_clk));

// for getting deposit enable
deposit depo(.res(res_en),.clk(clk),.dep_en(dep_en),.count_up(increment));

// for getting deposit enable
withdraw withd(.res(res_en),.clk(clk),.with_en(with_en),.count_down(decrement));

// main instantiation of balance increment and minimum and maximum balance flag LEDs
balance balvir(.res(res_en),.clk(clk),.with_en(decrement),.dep_en(increment),.balance(balance)
,.max_bal(max_bal),.min_bal(min_bal),.price(price));


// 2 bit counter 
counter bit_2(.clk(slowed_clk),.out(select_line));

// temp. reg - balance is 8 bit , to be converted to 12 bit bcd no. 
binary_to_bcd BIN_BCD(.bal(balance),.res(res_en),.bcd(bcd));

// 12 bit bcd no. would be sent to 4:1 MUX 
mux_4_to_1 mux(.D(4'b0),.C(bcd[11:8]),.B(bcd[7:4]),.A(bcd[3:0]),.sel(select_line),.out(bcd_to_seg));

// 4 bit selected from mux would be going to bcd_to_7 seg. converter
bcd_to_7_seg   bcd_seg(.bcd(bcd_to_seg),.seg(seg_balance)); // seg_balance is the final 7 bit output to be display on 7 seg.

// 7 segment 'an' enable pin output
decoder dec(.en(select_line),.an(an));

endmodule



