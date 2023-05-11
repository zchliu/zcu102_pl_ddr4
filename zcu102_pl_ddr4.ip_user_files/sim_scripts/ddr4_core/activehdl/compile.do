vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_10
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lmb_v10_v3_0_12
vlib activehdl/lmb_bram_if_cntlr_v4_0_21
vlib activehdl/blk_mem_gen_v8_4_5
vlib activehdl/iomodule_v3_1_8

vmap xpm activehdl/xpm
vmap microblaze_v11_0_10 activehdl/microblaze_v11_0_10
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_12 activehdl/lmb_v10_v3_0_12
vmap lmb_bram_if_cntlr_v4_0_21 activehdl/lmb_bram_if_cntlr_v4_0_21
vmap blk_mem_gen_v8_4_5 activehdl/blk_mem_gen_v8_4_5
vmap iomodule_v3_1_8 activehdl/iomodule_v3_1_8

vlog -work xpm  -sv2k12 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"/home/zchliu/Xilinx/2022.2/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/zchliu/Xilinx/2022.2/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/zchliu/Xilinx/2022.2/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_10 -93  \
"../../../ipstatic/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_0/sim/bd_bf3f_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_1/sim/bd_bf3f_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_12 -93  \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_2/sim/bd_bf3f_ilmb_0.vhd" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_3/sim/bd_bf3f_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_21 -93  \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_4/sim/bd_bf3f_dlmb_cntlr_0.vhd" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_5/sim/bd_bf3f_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_5  -v2k5 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_6/sim/bd_bf3f_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_7/sim/bd_bf3f_second_dlmb_cntlr_0.vhd" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_8/sim/bd_bf3f_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_9/sim/bd_bf3f_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_8 -93  \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/ip/ip_10/sim/bd_bf3f_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/bd_0/sim/bd_bf3f.v" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_0/sim/ddr4_core_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/map" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top" "+incdir+../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/phy/ddr4_core_phy_ddr4.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/ip_1/rtl/ip_top/ddr4_core_phy.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top/ddr4_core_ddr4.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top/ddr4_core_ddr4_mem_intfc.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/cal/ddr4_core_ddr4_cal_riu.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/rtl/ip_top/ddr4_core.sv" \
"../../../../zcu102_pl_ddr4.gen/sources_1/ip/ddr4_core/tb/ddr4_core_microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

