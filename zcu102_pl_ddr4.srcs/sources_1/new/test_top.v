module test_top(
	input ddr4_clk_p,
	input ddr4_clk_n,

	output [16:0] ddr4_adr,
	inout [15:0] ddr4_dq,
	inout [1:0] ddr4_dqs_c,
	inout [1:0] ddr4_dqs_t,
	inout [1:0] ddr4_dm_dbi_n,
	output [1:0] ddr4_ba,
	output ddr4_bg,
	output ddr4_ck_c,
	output ddr4_ck_t,
	output ddr4_cke,
	output ddr4_act_n,
	output ddr4_reset_n,
	output ddr4_odt,
	output ddr4_cs_n
    );

	//例化DDR4 IP

	//DDR4用户接口
	wire ui_clk;//工作时钟
	wire ui_rst;//复位
	(*keep = "TRUE"*) wire [27:0] ui_addr;
	(*keep = "TRUE"*) wire [2:0] ui_cmd;//写指令3'b000，读指令3'b001
	(*keep = "TRUE"*) wire ui_en;
	(*keep = "TRUE"*) wire ui_rdy;
	(*keep = "TRUE"*) wire [127:0] ui_rd_data;
	(*keep = "TRUE"*) wire ui_rd_data_valid;
	(*keep = "TRUE"*) wire [127:0] ui_wdf_data;
	(*keep = "TRUE"*) wire ui_wdf_end;
	(*keep = "TRUE"*) wire ui_wdf_rdy;
	(*keep = "TRUE"*) wire ui_wdf_wren;

	ddr4_core ddr4_u (
	.sys_rst(1'b0),                                      // input wire sys_rst//高有效异步复位，至少保持5ns

	.c0_sys_clk_p(ddr4_clk_p),                            // input wire c0_sys_clk_p//工作时钟，连接zcu102板卡的USER_SI570差分时钟，频率300MHz
	.c0_sys_clk_n(ddr4_clk_n),                            // input wire c0_sys_clk_n

	.c0_ddr4_ui_clk(ui_clk),                        // output wire c0_ddr4_ui_clk//用户接口时钟，即MMCM输出时钟，1/4的DDR4器件接口时钟，根据IP的默认配置与sys_clk一致
	.c0_ddr4_ui_clk_sync_rst(ui_rst),      // output wire c0_ddr4_ui_clk_sync_rst//用户接口中同步复位
	.c0_init_calib_complete(),        // output wire c0_init_calib_complete//表示PHY层完成校准，根据IP手册说明不需使用
	.c0_ddr4_app_addr(ui_addr),                    // input wire [27 : 0] c0_ddr4_app_addr//用户接口地址总线
	.c0_ddr4_app_cmd(ui_cmd),                      // input wire [2 : 0] c0_ddr4_app_cmd//用户接口指令
	.c0_ddr4_app_en(ui_en),                        // input wire c0_ddr4_app_en//用户指令发起
	.c0_ddr4_app_rdy(ui_rdy),                      // output wire c0_ddr4_app_rdy//向用户反馈IP已响应用户发起的指令，app_en和app_rdy同时为1表示指令被IP接受
	.c0_ddr4_app_rd_data(ui_rd_data),              // output wire [127 : 0] c0_ddr4_app_rd_data//读出数据
	.c0_ddr4_app_rd_data_valid(ui_rd_data_valid),  // output wire c0_ddr4_app_rd_data_valid//读出数据有效
	.c0_ddr4_app_wdf_data(ui_wdf_data),            // input wire [127 : 0] c0_ddr4_app_wdf_data//写数据
	.c0_ddr4_app_wdf_end(ui_wdf_end),              // input wire c0_ddr4_app_wdf_end//指示写数据为当前指令的最后1个数据
	.c0_ddr4_app_wdf_mask(16'h0000),            // input wire [15 : 0] c0_ddr4_app_wdf_mask//写数据掩码，固定全0表示不使用
	.c0_ddr4_app_wdf_rdy(ui_wdf_rdy),              // output wire c0_ddr4_app_wdf_rdy//向用户反馈IP已响应用户的写指令，app_en和app_rdy同时为1表示指令被IP接受
	.c0_ddr4_app_wdf_wren(ui_wdf_wren),            // input wire c0_ddr4_app_wdf_wren//写使能
	.c0_ddr4_app_rd_data_end(),      // output wire c0_ddr4_app_rd_data_end//根据IP手册说明不需使用
	.addn_ui_clkout1(),                      // output wire addn_ui_clkout1//默认配置输出的100MHz参考时钟
	.c0_ddr4_app_hi_pri(1'b0),                // input wire c0_ddr4_app_hi_pri//根据IP手册固定为0值
	.dbg_clk(),                                      // output wire dbg_clk
	.dbg_bus(),                                      // output wire [511 : 0] dbg_bus

	.c0_ddr4_adr(ddr4_adr),                              // output wire [16 : 0] c0_ddr4_adr
	.c0_ddr4_dq(ddr4_dq),                                // inout wire [15 : 0] c0_ddr4_dq
	.c0_ddr4_dqs_c(ddr4_dqs_c),                          // inout wire [1 : 0] c0_ddr4_dqs_c
	.c0_ddr4_dqs_t(ddr4_dqs_t),                          // inout wire [1 : 0] c0_ddr4_dqs_t
	.c0_ddr4_dm_dbi_n(ddr4_dm_dbi_n),                    // inout wire [1 : 0] c0_ddr4_dm_dbi_n
	.c0_ddr4_ba(ddr4_ba),                                // output wire [1 : 0] c0_ddr4_ba
	.c0_ddr4_bg(ddr4_bg),                                // output wire [0 : 0] c0_ddr4_bg
	.c0_ddr4_ck_c(ddr4_ck_c),                            // output wire [0 : 0] c0_ddr4_ck_c
	.c0_ddr4_ck_t(ddr4_ck_t),                            // output wire [0 : 0] c0_ddr4_ck_t
	.c0_ddr4_cke(ddr4_cke),                              // output wire [0 : 0] c0_ddr4_cke
	.c0_ddr4_act_n(ddr4_act_n),                          // output wire c0_ddr4_act_n
	.c0_ddr4_reset_n(ddr4_reset_n),                      // output wire c0_ddr4_reset_n
	.c0_ddr4_odt(ddr4_odt),                              // output wire [0 : 0] c0_ddr4_odt
	.c0_ddr4_cs_n(ddr4_cs_n)                            // output wire [0 : 0] c0_ddr4_cs_n
	);

	//ddr4用户接口作为FIFO使用
	(*keep = "TRUE"*) wire wr_en;//写使能
	(*keep = "TRUE"*) wire wr_able;//可写入WR_THRESHOLD个数据
	(*keep = "TRUE"*) wire [127:0] wr_data;//写入数据
	(*keep = "TRUE"*) wire rd_en;//读使能
	(*keep = "TRUE"*) wire rd_able;//可读出RD_THRESHOLD个数据
	(*keep = "TRUE"*) wire [127:0] rd_data;//读出数据
	(*keep = "TRUE"*) wire rd_data_valid;//读出数据有效
	
	mig_fifo mig_fifo_u (
	.ui_clk(ui_clk),
	.ui_rst(ui_rst),
	.ui_en(ui_en),
	.ui_cmd(ui_cmd),
	.ui_addr(ui_addr),
	.ui_rdy(ui_rdy),
	.ui_rd_data(ui_rd_data),
	.ui_rd_data_valid(ui_rd_data_valid),
	.ui_wdf_wren(ui_wdf_wren),
	.ui_wdf_end(ui_wdf_end),
	.ui_wdf_data(ui_wdf_data),
	.ui_wdf_rdy(ui_wdf_rdy),
	
	.wr_en(wr_en),
	.wr_able(wr_able),
	.wr_data(wr_data),
	.rd_en(rd_en),
	.rd_able(rd_able),
	.rd_data(rd_data),
	.rd_data_valid(rd_data_valid)
	);
	
	//测试
	test test_u (
	.clk(ui_clk),
	.rst(ui_rst),
	.wr_en(wr_en),
	.wr_able(wr_able),
	.wr_data(wr_data),
	.rd_en(rd_en),
	.rd_able(rd_able),
	.rd_data(rd_data),
	.rd_data_valid(rd_data_valid)
	);

endmodule