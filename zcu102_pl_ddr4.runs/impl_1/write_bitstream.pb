
�
�Design is having concatenated BRAM controllers(heterogenous memory), this configuration is not supported by Updatemem for current device part. Only the first BRAM controller will be added to .MMI and used by Updatemem to update the bitstream with new data.1470*memdataZ28-362h px� 
h
Command: %s
53*	vivadotcl27
#write_bitstream -force test_top.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xczu9eg2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xczu9eg2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
�Invalid Constraint: [%s] The Memory IP reset port %s has an incompatible IO Standard LVCMOS18 selected. If a level shifter or similar is used to ensure compatibility, this DRC can be demoted. For more details please refer AR66800.%s*DRC2:
 "$
ddr4_u	ddr4_u2default:default2default:default2
 2default:default2>
 &DRC|Memory|Port Additional Constraints2default:default8ZMIG-69h px� 
�
�LUT equation term check: Used physical LUT pin 'A1' of cell %s (pin %s) is not included in the LUT equation: 'O5=(A5*A4)+(A5*(~A4)*(~A3))+((~A5))'. If this cell is a user instantiated LUT in the design, please remove connectivity to the pin or change the equation and/or INIT string of the LUT to prevent this issue. If the cell is inferred or IP created LUT, please regenerate the IP and/or resynthesize the design to attempt to correct the issue.%s*DRC2�
 "�
Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1	Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_12default:default2default:default2�
 "�
Udbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I0Udbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I02default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8Z	PDCN-1569h px� 
�
�LUT equation term check: Used physical LUT pin 'A2' of cell %s (pin %s) is not included in the LUT equation: 'O5=(A5*A4)+(A5*(~A4)*(~A3))+((~A5))'. If this cell is a user instantiated LUT in the design, please remove connectivity to the pin or change the equation and/or INIT string of the LUT to prevent this issue. If the cell is inferred or IP created LUT, please regenerate the IP and/or resynthesize the design to attempt to correct the issue.%s*DRC2�
 "�
Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1	Rdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_12default:default2default:default2�
 "�
Udbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I1Udbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_switch/temp_curid[31]_i_1/I12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8Z	PDCN-1569h px� 
�
�LUT equation term check: Used physical LUT pin 'A2' of cell %s (pin %s) is not included in the LUT equation: 'O6=(A6+~A6)*((A5))'. If this cell is a user instantiated LUT in the design, please remove connectivity to the pin or change the equation and/or INIT string of the LUT to prevent this issue. If the cell is inferred or IP created LUT, please regenerate the IP and/or resynthesize the design to attempt to correct the issue.%s*DRC2�
 "�
Bdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.id_state[0]_i_1	Bdbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.id_state[0]_i_12default:default2default:default2�
 "�
Edbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.id_state[0]_i_1/I0Edbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.id_state[0]_i_1/I02default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8Z	PDCN-1569h px� 
�
aNo routable loads: 147 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2�
 "�
5ddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_riu/LMB_CE_riu5ddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_riu/LMB_CE_riu2default:default"�
5ddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_riu/LMB_UE_riu5ddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_riu/LMB_UE_riu2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[12]Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[12]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[13]Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[13]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[14]Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[14]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[15]Iddr4_u/inst/u_ddr4_mem_intfc/u_ddr_cal_top/u_ddr_cal/u_xsdb_arbiter/Q[15]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_upp/SYNC[0].sync_reg[1]Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_upp/SYNC[0].sync_reg[1]2default:default"�
Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[0].sync_reg[1]Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[0].sync_reg[1]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_low/SYNC[0].sync_reg[1]Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_low/SYNC[0].sync_reg[1]2default:default"�
Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_upp/SYNC[0].sync_reg[1]Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_upp/SYNC[0].sync_reg[1]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_upp/SYNC[1].sync_reg[1]Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_upp/SYNC[1].sync_reg[1]2default:default"�
Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[1].sync_reg[1]Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[1].sync_reg[1]2default:default"�
Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_upp/SYNC[1].sync_reg[1]Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_upp/SYNC[1].sync_reg[1]2default:default"�
Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_low/SYNC[1].sync_reg[1]Iddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_fixdly_rdy_low/SYNC[1].sync_reg[1]2default:default"�
Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[2].sync_reg[1]Fddr4_u/inst/u_ddr4_mem_intfc/u_phy2clb_phy_rdy_low/SYNC[2].sync_reg[1]2default:..."0
(the first 15 of 145 listed)2default:default2default:default2=
 %DRC|Implementation|Routing|Chip Level2default:default8Z	RTSTAT-10h px� 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 5 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
82default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
_
Writing bitstream %s...
11*	bitstream2"
./test_top.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
112default:default2
62default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:432default:default2
00:00:232default:default2
5802.5742default:default2
271.8872default:default2
78012default:default2
170172default:defaultZ17-722h px� 


End Record