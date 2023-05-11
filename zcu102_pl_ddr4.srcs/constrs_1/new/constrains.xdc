
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 65536 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list ddr4_u/inst/u_ddr4_infrastructure/u_bufg_divClk_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 128 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {rd_data[0]} {rd_data[1]} {rd_data[2]} {rd_data[3]} {rd_data[4]} {rd_data[5]} {rd_data[6]} {rd_data[7]} {rd_data[8]} {rd_data[9]} {rd_data[10]} {rd_data[11]} {rd_data[12]} {rd_data[13]} {rd_data[14]} {rd_data[15]} {rd_data[16]} {rd_data[17]} {rd_data[18]} {rd_data[19]} {rd_data[20]} {rd_data[21]} {rd_data[22]} {rd_data[23]} {rd_data[24]} {rd_data[25]} {rd_data[26]} {rd_data[27]} {rd_data[28]} {rd_data[29]} {rd_data[30]} {rd_data[31]} {rd_data[32]} {rd_data[33]} {rd_data[34]} {rd_data[35]} {rd_data[36]} {rd_data[37]} {rd_data[38]} {rd_data[39]} {rd_data[40]} {rd_data[41]} {rd_data[42]} {rd_data[43]} {rd_data[44]} {rd_data[45]} {rd_data[46]} {rd_data[47]} {rd_data[48]} {rd_data[49]} {rd_data[50]} {rd_data[51]} {rd_data[52]} {rd_data[53]} {rd_data[54]} {rd_data[55]} {rd_data[56]} {rd_data[57]} {rd_data[58]} {rd_data[59]} {rd_data[60]} {rd_data[61]} {rd_data[62]} {rd_data[63]} {rd_data[64]} {rd_data[65]} {rd_data[66]} {rd_data[67]} {rd_data[68]} {rd_data[69]} {rd_data[70]} {rd_data[71]} {rd_data[72]} {rd_data[73]} {rd_data[74]} {rd_data[75]} {rd_data[76]} {rd_data[77]} {rd_data[78]} {rd_data[79]} {rd_data[80]} {rd_data[81]} {rd_data[82]} {rd_data[83]} {rd_data[84]} {rd_data[85]} {rd_data[86]} {rd_data[87]} {rd_data[88]} {rd_data[89]} {rd_data[90]} {rd_data[91]} {rd_data[92]} {rd_data[93]} {rd_data[94]} {rd_data[95]} {rd_data[96]} {rd_data[97]} {rd_data[98]} {rd_data[99]} {rd_data[100]} {rd_data[101]} {rd_data[102]} {rd_data[103]} {rd_data[104]} {rd_data[105]} {rd_data[106]} {rd_data[107]} {rd_data[108]} {rd_data[109]} {rd_data[110]} {rd_data[111]} {rd_data[112]} {rd_data[113]} {rd_data[114]} {rd_data[115]} {rd_data[116]} {rd_data[117]} {rd_data[118]} {rd_data[119]} {rd_data[120]} {rd_data[121]} {rd_data[122]} {rd_data[123]} {rd_data[124]} {rd_data[125]} {rd_data[126]} {rd_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {test_u/cnt_err[0]} {test_u/cnt_err[1]} {test_u/cnt_err[2]} {test_u/cnt_err[3]} {test_u/cnt_err[4]} {test_u/cnt_err[5]} {test_u/cnt_err[6]} {test_u/cnt_err[7]} {test_u/cnt_err[8]} {test_u/cnt_err[9]} {test_u/cnt_err[10]} {test_u/cnt_err[11]} {test_u/cnt_err[12]} {test_u/cnt_err[13]} {test_u/cnt_err[14]} {test_u/cnt_err[15]} {test_u/cnt_err[16]} {test_u/cnt_err[17]} {test_u/cnt_err[18]} {test_u/cnt_err[19]} {test_u/cnt_err[20]} {test_u/cnt_err[21]} {test_u/cnt_err[22]} {test_u/cnt_err[23]} {test_u/cnt_err[24]} {test_u/cnt_err[25]} {test_u/cnt_err[26]} {test_u/cnt_err[27]} {test_u/cnt_err[28]} {test_u/cnt_err[29]} {test_u/cnt_err[30]} {test_u/cnt_err[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 128 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {wr_data[0]} {wr_data[1]} {wr_data[2]} {wr_data[3]} {wr_data[4]} {wr_data[5]} {wr_data[6]} {wr_data[7]} {wr_data[8]} {wr_data[9]} {wr_data[10]} {wr_data[11]} {wr_data[12]} {wr_data[13]} {wr_data[14]} {wr_data[15]} {wr_data[16]} {wr_data[17]} {wr_data[18]} {wr_data[19]} {wr_data[20]} {wr_data[21]} {wr_data[22]} {wr_data[23]} {wr_data[24]} {wr_data[25]} {wr_data[26]} {wr_data[27]} {wr_data[28]} {wr_data[29]} {wr_data[30]} {wr_data[31]} {wr_data[32]} {wr_data[33]} {wr_data[34]} {wr_data[35]} {wr_data[36]} {wr_data[37]} {wr_data[38]} {wr_data[39]} {wr_data[40]} {wr_data[41]} {wr_data[42]} {wr_data[43]} {wr_data[44]} {wr_data[45]} {wr_data[46]} {wr_data[47]} {wr_data[48]} {wr_data[49]} {wr_data[50]} {wr_data[51]} {wr_data[52]} {wr_data[53]} {wr_data[54]} {wr_data[55]} {wr_data[56]} {wr_data[57]} {wr_data[58]} {wr_data[59]} {wr_data[60]} {wr_data[61]} {wr_data[62]} {wr_data[63]} {wr_data[64]} {wr_data[65]} {wr_data[66]} {wr_data[67]} {wr_data[68]} {wr_data[69]} {wr_data[70]} {wr_data[71]} {wr_data[72]} {wr_data[73]} {wr_data[74]} {wr_data[75]} {wr_data[76]} {wr_data[77]} {wr_data[78]} {wr_data[79]} {wr_data[80]} {wr_data[81]} {wr_data[82]} {wr_data[83]} {wr_data[84]} {wr_data[85]} {wr_data[86]} {wr_data[87]} {wr_data[88]} {wr_data[89]} {wr_data[90]} {wr_data[91]} {wr_data[92]} {wr_data[93]} {wr_data[94]} {wr_data[95]} {wr_data[96]} {wr_data[97]} {wr_data[98]} {wr_data[99]} {wr_data[100]} {wr_data[101]} {wr_data[102]} {wr_data[103]} {wr_data[104]} {wr_data[105]} {wr_data[106]} {wr_data[107]} {wr_data[108]} {wr_data[109]} {wr_data[110]} {wr_data[111]} {wr_data[112]} {wr_data[113]} {wr_data[114]} {wr_data[115]} {wr_data[116]} {wr_data[117]} {wr_data[118]} {wr_data[119]} {wr_data[120]} {wr_data[121]} {wr_data[122]} {wr_data[123]} {wr_data[124]} {wr_data[125]} {wr_data[126]} {wr_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list rd_able]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list rd_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list wr_able]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list wr_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
