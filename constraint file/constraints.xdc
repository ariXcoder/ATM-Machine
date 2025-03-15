## for clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

## deposit enable
set_property PACKAGE_PIN T18 [get_ports dep] 
set_property IOSTANDARD LVCMOS33 [get_ports dep]

## withdraw enable
set_property PACKAGE_PIN U17 [get_ports with] 
set_property IOSTANDARD LVCMOS33 [get_ports with]

# reset 
set_property PACKAGE_PIN U18 [get_ports res] 
set_property IOSTANDARD LVCMOS33 [get_ports res]

## LED pin for multiple currency
set_property PACKAGE_PIN V14 [get_ports mul_switch] 
set_property IOSTANDARD LVCMOS33 [get_ports mul_switch]

# LED pin for minimum balance
set_property PACKAGE_PIN V13 [get_ports min_bal] 
set_property IOSTANDARD LVCMOS33 [get_ports min_bal]

## LED pin for maximum balance
set_property PACKAGE_PIN U14 [get_ports max_bal] 
set_property IOSTANDARD LVCMOS33 [get_ports max_bal]

## INPUT DATA from 6 switches , denoting the selected currency
set_property PACKAGE_PIN V17 [get_ports data_in[0]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[0]]

set_property PACKAGE_PIN V16 [get_ports data_in[1]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[1]]

set_property PACKAGE_PIN W16 [get_ports data_in[2]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[2]]

set_property PACKAGE_PIN W17 [get_ports data_in[3]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[3]]

set_property PACKAGE_PIN W15 [get_ports data_in[4]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[4]]

set_property PACKAGE_PIN V15 [get_ports data_in[5]]
set_property IOSTANDARD LVCMOS33 [get_ports data_in[5]]


## OUTPUT FOR 7 SEGMENT DISPLAY ,showing the balance
set_property PACKAGE_PIN W7 [get_ports seg_balance[6] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[6]]

set_property PACKAGE_PIN W6 [get_ports  seg_balance[5] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[5]]

set_property PACKAGE_PIN U8 [get_ports  seg_balance[4] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[4]]

set_property PACKAGE_PIN V8 [get_ports  seg_balance[3] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[3]]

set_property PACKAGE_PIN U5 [get_ports  seg_balance[2] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[2]]

set_property PACKAGE_PIN V5 [get_ports  seg_balance[1] ]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[1]]

set_property PACKAGE_PIN U7 [get_ports  seg_balance[0]]
set_property IOSTANDARD LVCMOS33 [get_ports  seg_balance[0]]



## output for 7 segment display 's enable pin

set_property PACKAGE_PIN U2 [get_ports  an[0] ]
set_property IOSTANDARD LVCMOS33 [get_ports  an[0]]


set_property PACKAGE_PIN U4 [get_ports  an[1] ]
set_property IOSTANDARD LVCMOS33 [get_ports  an[1]]


set_property PACKAGE_PIN V4 [get_ports  an[2] ]
set_property IOSTANDARD LVCMOS33 [get_ports  an[2]]

set_property PACKAGE_PIN W4 [get_ports  an[3]]
set_property IOSTANDARD LVCMOS33 [get_ports  an[3]]


