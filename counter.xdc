set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property PACKAGE_PIN J15 [get_ports reset]
set_property PACKAGE_PIN H15 [get_ports {segments[7]}]
set_property PACKAGE_PIN L18 [get_ports {segments[6]}]
set_property PACKAGE_PIN T11 [get_ports {segments[5]}]
set_property PACKAGE_PIN P15 [get_ports {segments[4]}]
set_property PACKAGE_PIN K13 [get_ports {segments[3]}]
set_property PACKAGE_PIN K16 [get_ports {segments[2]}]
set_property PACKAGE_PIN R10 [get_ports {segments[1]}]
set_property PACKAGE_PIN T10 [get_ports {segments[0]}]


set_property PACKAGE_PIN J17 [get_ports {anode[7]}]
set_property PACKAGE_PIN J18 [get_ports {anode[6]}]
set_property PACKAGE_PIN T9 [get_ports {anode[5]}]
set_property PACKAGE_PIN J14 [get_ports {anode[4]}]
set_property PACKAGE_PIN P14 [get_ports {anode[3]}]
set_property PACKAGE_PIN T14 [get_ports {anode[2]}]
set_property PACKAGE_PIN K2 [get_ports {anode[1]}]
set_property PACKAGE_PIN U13 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[4]}]


set_property IOSTANDARD LVCMOS33 [get_ports {houradder[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {houradder[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {minuteadder[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {minuteadder[0]}]


set_property PACKAGE_PIN M17 [get_ports {houradder[0]}]
set_property PACKAGE_PIN P17 [get_ports {houradder[1]}]
set_property PACKAGE_PIN M18 [get_ports {minuteadder[1]}]
set_property PACKAGE_PIN P18 [get_ports {minuteadder[0]}]

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; #IO_L18N_T2_A11_D27_14 Sch=led[5]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { LED[8] }]; #IO_L16N_T2_A15_D31_14 Sch=led[8]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]; #IO_L14N_T2_SRCC_14 Sch=led[9]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]; #IO_L22P_T3_A05_D21_14 Sch=led[10]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[11]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]; #IO_L16P_T2_CSI_B_14 Sch=led[12]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]; #IO_L22N_T3_A04_D20_14 Sch=led[13]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]; #IO_L20N_T3_A07_D23_14 Sch=led[14]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=led[15]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { alarm }]; #IO_L18P_T2_A24_15 Sch=led[0]
