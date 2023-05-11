module mig_fifo(
	//MIG用户接口
	input ui_clk,//MIG用户接口时钟
	input ui_rst,//MIG用户接口复位
	
	output ui_en,//指令有效标记
	output [2:0] ui_cmd,//写指令3’b000，读指令3'b001
	output [27:0] ui_addr,//地址，每个地址对应DDR4物理层16位数据总线
	input ui_rdy,//指令被接受标记
	
	input [127:0] ui_rd_data,//读数据
	input ui_rd_data_valid,//读数据有效
	
	output ui_wdf_wren,//写数据有效标记
	output ui_wdf_end,//写数据结束，与ui_wdf_wren对齐
	output [127:0] ui_wdf_data,//写数据
	input ui_wdf_rdy,//数据可写标记，表示MIG内部缓冲可以装下新的写数据
	
	//FIFO操作接口
	input wr_en,//写使能
	output wr_able,//可写入WR_THRESHOLD个数据，写入过程中可能变为无效
	input [127:0] wr_data,//写入数据
	input rd_en,//读使能
	output rd_able,//可读出RD_THRESHOLD个数据，读出过程中可能变为无效
	output [127:0] rd_data,//读出数据，比rd_en延迟1个时钟周期
	output rd_data_valid//读出数据有效，比rd_en延迟1个时钟周期
    );
	
	//用于输出wr_able和rd_able的判断
	//外部模块一次写入的数据量
	//数值必须偶数
	parameter WR_BLK = 9'd200;//写FIFO可以写入200个数据
	parameter RD_BLK = 9'd128;//读FIFO可以读出128个数据
	
	//MIG用户接口指令值
	localparam CMD_WR = 3'b000;
	localparam CMD_RD = 3'b001;
	
	//时钟与复位
	wire clk;
	assign clk = ui_clk;
	
	wire rst;
	assign rst = ui_rst;
	
	//例化写FIFO*****************************************************************************************************
	//写FIFO由ping/pong 2个FIFO组成，用于保证在数据送入MIG用户接口时，FIFO读使能可以使用时序逻辑赋值，即读使能有效的时钟周期可以使用另1个FIFO赋值
	(*keep = "TRUE"*) reg ping_pong_flag_wr = 1'b0;//0表示写入ping，1表示写入pong
	(*keep = "TRUE"*) reg ping_pong_flag_rd = 1'b0;//0表示读出ping，1表示读出pong
	
	//注意：ping_pong_flag_rd在未加keep时上板测试发现未能赋值，可能源于vivado的综合bug
	
	reg [127:0] ping_din = 128'd0;
	reg ping_wr_en = 1'b0;
	(*keep = "TRUE"*) reg ping_rd_en = 1'b0;
	(*keep = "TRUE"*) wire [127:0] ping_dout;
	wire [8:0] ping_data_count;
	
	reg [8:0] ping_2rd = 9'd0;//可读数据量
	reg [8:0] ping_2wr = 9'd256;//可写数据量
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			ping_2rd <= 9'd0;
			ping_2wr <= 9'd256;
		end
		else begin
			ping_2rd <= ping_data_count;
			ping_2wr <= 9'd256-ping_data_count;
		end
	end
	
	fifo_ddr4_buf fifo_wr_ping (
	.clk(clk),                  // input wire clk
	.srst(rst),                // input wire srst
	.din(ping_din),                  // input wire [127 : 0] din
	.wr_en(ping_wr_en),              // input wire wr_en
	.rd_en(ping_rd_en),              // input wire rd_en
	.dout(ping_dout),                // output wire [127 : 0] dout
	.full(),                // output wire full
	.empty(),              // output wire empty
	.data_count(ping_data_count),    // output wire [8 : 0] data_count
	.wr_rst_busy(),  // output wire wr_rst_busy
	.rd_rst_busy()  // output wire rd_rst_busy
	);
	
	reg [127:0] pong_din = 128'd0;
	reg pong_wr_en = 1'b0;
	(*keep = "TRUE"*) reg pong_rd_en = 1'b0;
	(*keep = "TRUE"*) wire [127:0] pong_dout;
	wire [8:0] pong_data_count;
	
	reg [8:0] pong_2rd = 9'd0;//可读数据量
	reg [8:0] pong_2wr = 9'd256;//可写数据量
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			pong_2rd <= 9'd0;
			pong_2wr <= 9'd256;
		end
		else begin
			pong_2rd <= pong_data_count;
			pong_2wr <= 9'd256-pong_data_count;
		end
	end
	
	fifo_ddr4_buf fifo_wr_pong (
	.clk(clk),                  // input wire clk
	.srst(rst),                // input wire srst
	.din(pong_din),                  // input wire [127 : 0] din
	.wr_en(pong_wr_en),              // input wire wr_en
	.rd_en(pong_rd_en),              // input wire rd_en
	.dout(pong_dout),                // output wire [127 : 0] dout
	.full(),                // output wire full
	.empty(),              // output wire empty
	.data_count(pong_data_count),    // output wire [8 : 0] data_count
	.wr_rst_busy(),  // output wire wr_rst_busy
	.rd_rst_busy()  // output wire rd_rst_busy
	);
	
	//读FIFO例化*****************************************************************************
	(*keep = "TRUE"*) reg [127:0] rd_din = 128'd0;
	(*keep = "TRUE"*) reg rd_wr_en = 1'b0;
	reg rd_rd_en = 1'b0;
	wire [127:0] rd_dout;
	wire [8:0] rd_data_count;
	
	//FIFO读接口
	//外部模块在发现rd_able有效后，一次从FIFO读出RD_BLK个数据，不考虑空读的情况
	assign rd_data = rd_dout;//由于FIFO具有FWFT属性，dout与rd_en对齐
	assign rd_data_valid = rd_rd_en;//由于FIFO具有FWFT属性，
	
	always @(posedge clk) begin
		rd_rd_en <= rd_en;
	end
	
	reg [8:0] rd_2rd = 9'd0;//可读数据量
	reg [8:0] rd_2wr = 9'd256;//可写数据量
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			rd_2rd <= 9'd0;
			rd_2wr <= 9'd256;
		end
		else begin
			rd_2rd <= rd_data_count;
			rd_2wr <= 9'd256-rd_data_count;
		end
	end
	
	fifo_ddr4_buf fifo_rd (
	.clk(clk),                  // input wire clk
	.srst(rst),                // input wire srst
	.din(rd_din),                  // input wire [127 : 0] din
	.wr_en(rd_wr_en),              // input wire wr_en
	.rd_en(rd_rd_en),              // input wire rd_en
	.dout(rd_dout),                // output wire [127 : 0] dout
	.full(),                // output wire full
	.empty(),              // output wire empty
	.data_count(rd_data_count),    // output wire [8 : 0] data_count
	.wr_rst_busy(),  // output wire wr_rst_busy
	.rd_rst_busy()  // output wire rd_rst_busy
	);
	
	//MIG用户接口状态机*********************************************************
	(*keep = "TRUE"*) reg [24:0] ddr4_2wr = 25'h1_FFF_FFF;//DDR4可写数据量，一轮写读操作结束后更新数值
	(*keep = "TRUE"*) reg [24:0] ddr4_2rd = 25'd0;//DDR4可读数据量，一轮写读操作结束后更新数值
	
	(*keep = "TRUE"*) reg [24:0] ddr4_wr_addr = 25'd0;//DDR4下个写地址，每次指令赋值时更新下个地址
	(*keep = "TRUE"*) reg [24:0] ddr4_rd_addr = 25'd0;//DDR4下个读地址，每次指令赋值时更新下个地址
	
	(*keep = "TRUE"*) reg [24:0] ui_addr_reg = 25'd0;//MIG地址高25位
	assign ui_addr = {ui_addr_reg, 3'b000};
	
	reg [2:0] ui_cmd = CMD_RD;
	reg ui_en = 1'b0;
	reg ui_wdf_wren = 1'b0;
	
	reg [127:0] ui_wdf_data = 128'd0;
	
	assign ui_wdf_end = ui_wdf_wren;
	
	(*keep = "TRUE"*) reg [8:0] cnt_cmd = 9'd1;//MIG指令计数
	(*keep = "TRUE"*) reg [8:0] cnt_data = 9'd1;//MIG数据计数，读计数rd_valid，写计数(wren & wdf_rdy)
	
	/*
	状态机
	状态机工作条件，写读操作都面向缓冲FIFO
	
	读优先
	如果DDR4内数据量和读FIFO可写数据量都大于读门限，读出数据进入读FIFO
	如果DDR4可写数据量和写FIFO可读数据量都大于写门限，读出写FIFO内数据送入DDR4
	
	注意!!
	MIG用户接口的写操作分为2个部分，指令部分与数据部分，2个部分相互独立
	({ui_en, ui_rdy} == 2'b11)表示指令被MIG接受，在此之前1个时钟周期或者之后2个时钟周期以内MIG可接受数据
	({ui_wdf_wren, ui_wdf_rdy} == 2'b11)表示写数据被MIG接受
	*/
	localparam IDLE = 6'b000_001;
	localparam RD_CMD = 6'b000_010;
	localparam RD_DATA = 6'b000_100;
	localparam WR = 6'b001_000;
	localparam WR_WAIT_DATA = 6'b010_000;
	localparam WR_WAIT_CMD = 6'b100_000;
	(*keep = "TRUE"*) reg [5:0] state = IDLE;
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			state <= IDLE;
			
			ui_en <= 1'b0;
			ui_cmd <= CMD_RD;
			ui_addr_reg <= 25'd0;
			ui_wdf_wren <= 1'b0;
			ui_wdf_data <= 128'd0;
			
			ddr4_wr_addr <= 25'd0;
			ddr4_rd_addr <= 25'd0;
			
			ping_rd_en <= 1'b0;
			pong_rd_en <= 1'b0;
			ping_pong_flag_rd <= 1'b0;
		end
		else begin
			case (state)
				IDLE: begin
					if ((ddr4_2rd >= {16'd0, RD_BLK}) && (rd_2wr >= RD_BLK)) begin
						//启动1轮读操作，共RD_BLK次读操作
						
						//MIG指令
						ui_en <= 1'b1;
						ui_cmd <= CMD_RD;
						ui_addr_reg <= ddr4_rd_addr;
						
						//更新MIG读地址
						ddr4_rd_addr <= ddr4_rd_addr+25'd1;
						
						//状态转移
						state <= RD_CMD;
						
						ui_wdf_wren <= 1'b0;
						ui_wdf_data <= 128'd0;
						
						ddr4_wr_addr <= ddr4_wr_addr;//MIG写地址保持
						
						ping_rd_en <= 1'b0;
						pong_rd_en <= 1'b0;
						ping_pong_flag_rd <= 1'b0;
					end
					else if ((ddr4_2wr >= {16'd0, WR_BLK}) && (pong_2rd >= {1'b0, WR_BLK[8:1]})) begin//用pong判断因为pong晚于ping写入数据
						//启动1轮写操作，共WR_BLK次写操作
						
						//MIG指令接口
						ui_en <= 1'b1;
						ui_cmd <= CMD_WR;
						ui_addr_reg <= ddr4_wr_addr;
						
						//更新MIG写地址
						ddr4_wr_addr <= ddr4_wr_addr+25'd1;
						
						//MIG数据接口
						ui_wdf_wren <= 1'b1;
						ui_wdf_data <= ping_dout;//由于每次读写次数都为偶数，因此启动时一定是读取ping数据
						
						ping_rd_en <= 1'b1;//读出下个ping数据
						ping_pong_flag_rd <= 1'b1;//下次读出pong数据
						pong_rd_en <= 1'b0;
						
						//状态转移
						state <= WR;
						
						ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
					end
					else begin
						state <= state;
						
						ui_en <= 1'b0;
						ui_cmd <= CMD_RD;
						ui_addr_reg <= 25'd0;
						ui_wdf_wren <= 1'b0;
						ui_wdf_data <= 128'd0;
						
						ddr4_wr_addr <= ddr4_wr_addr;//MIG写地址保持
						ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
						
						ping_rd_en <= 1'b0;
						pong_rd_en <= 1'b0;
						ping_pong_flag_rd <= 1'b0;
					end
				end
				
				RD_CMD: begin//等待MIG接受rd_cnt个读指令
					//当前状态ui_en固定为1，MIG接受读指令只用判断ui_rdy
					if (ui_rdy == 1'b1) begin
						//读指令被接受
						case (cnt_cmd)
							RD_BLK: begin
								//一轮读指令完成，关闭读指令
								ui_en <= 1'b0;
								ui_cmd <= CMD_RD;
								ui_addr_reg <= 25'd0;
								
								//MIG读地址保持
								ddr4_rd_addr <= ddr4_rd_addr;
								
								//状态转移，等待数据全部送出
								state <= RD_DATA;
							end
							
							default: begin
								//下个读指令
								ui_en <= 1'b1;
								ui_cmd <= CMD_RD;
								ui_addr_reg <= ddr4_rd_addr;
								
								//更新MIG读地址
								ddr4_rd_addr <= ddr4_rd_addr+25'd1;
								
								//状态保持
								state <= state;
							end
						endcase
					end
					else begin
						//读指令保持
						ui_en <= 1'b1;
						ui_cmd <= CMD_RD;
						ui_addr_reg <= ui_addr_reg;
						//MIG读地址保持
						ddr4_rd_addr <= ddr4_rd_addr;
						//状态保持
						state <= state;
					end
					
					ui_wdf_wren <= 1'b0;
					ui_wdf_data <= 128'd0;
					
					ddr4_wr_addr <= ddr4_wr_addr;//MIG写地址保持
					
					ping_rd_en <= 1'b0;
					pong_rd_en <= 1'b0;
					ping_pong_flag_rd <= 1'b0;
				end
				
				RD_DATA: begin
					//等待接收rd_cnt个读数据
					case ({cnt_data, ui_rd_data_valid})
						{RD_BLK, 1'b1}: begin
							//一轮读操作全部数据已读出
							//状态转移
							state <= IDLE;
						end
						
						default: begin
							//状态保持
							state <= state;
						end
					endcase
					
					ui_en <= 1'b0;
					ui_cmd <= CMD_RD;
					ui_addr_reg <= 25'd0;
					
					ui_wdf_wren <= 1'b0;
					ui_wdf_data <= 128'd0;
					
					ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
					ddr4_wr_addr <= ddr4_wr_addr;//MIG写地址保持
					
					ping_rd_en <= 1'b0;
					pong_rd_en <= 1'b0;
					ping_pong_flag_rd <= 1'b0;
				end
				
				WR: begin
					//进入当前状态时，ui_en和ui_wdf_wren值都为1
					case ({ui_rdy, ui_wdf_rdy})//判断写指令和写数据被IP接受情况
						{1'b1, 1'b1}: begin
							//MIG接受写指令和写数据
							
							case (cnt_data)//在此状态下cnt_cmd和cnt_data数值相等，只判断两者之一
								WR_BLK: begin
									//1轮写操作结束
									
									//写指令结束
									ui_en <= 1'b0;
									ui_cmd <= CMD_RD;
									ui_addr_reg <= 25'd0;
									
									//MIG写地址保持
									ddr4_wr_addr <= ddr4_wr_addr;
									
									//写数据结束
									ui_wdf_wren <= 1'b0;
									ui_wdf_data <= 128'd0;
									
									//状态转移
									state <= IDLE;
									
									ping_rd_en <= 1'b0;
									pong_rd_en <= 1'b0;
									ping_pong_flag_rd <= 1'b0;
								end
								
								default: begin
									//1轮写操作未完成
									//更新下个指令
									ui_en <= 1'b1;
									ui_cmd <= CMD_WR;
									ui_addr_reg <= ddr4_wr_addr;
									
									//MIG写地址更新
									ddr4_wr_addr <= ddr4_wr_addr+25'd1;
									
									//写数据更新
									ui_wdf_wren <= 1'b1;
									case (ping_pong_flag_rd)
										1'b0: begin
											//读ping
											ui_wdf_data <= ping_dout;
											ping_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b1;
											
											pong_rd_en <= 1'b0;
										end
										
										1'b1: begin
											//读pong
											ui_wdf_data <= pong_dout;
											pong_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b0;
											
											ping_rd_en <= 1'b0;
										end
									endcase
									
									//状态保持
									state <= state;
								end
							endcase
						end
						
						{1'b1, 1'b0}: begin
							//MIG接受写指令，未接受写数据
							
							//指令结束
							ui_en <= 1'b0;
							ui_cmd <= CMD_RD;
							ui_addr_reg <= 25'd0;
							
							//MIG写地址保持
							ddr4_wr_addr <= ddr4_wr_addr;
							
							//写数据保持
							ui_wdf_wren <= 1'b1;
							ui_wdf_data <= ui_wdf_data;
							
							//状态转移
							state <= WR_WAIT_DATA;
							
							ping_rd_en <= 1'b0;
							pong_rd_en <= 1'b0;
							ping_pong_flag_rd <= ping_pong_flag_rd;//保持
						end
						
						{1'b0, 1'b1}: begin
							//MIG接受写数据，未接受写指令
							
							//写数据停止
							ui_wdf_wren <= 1'b0;
							ui_wdf_data <= 128'd0;
							
							//指令保持
							ui_en <= 1'b1;
							ui_cmd <= CMD_WR;
							ui_addr_reg <= ui_addr_reg;
							
							//MIG写地址保持
							ddr4_wr_addr <= ddr4_wr_addr;
							
							//状态转移
							state <= WR_WAIT_CMD;
							
							ping_rd_en <= 1'b0;
							pong_rd_en <= 1'b0;
							ping_pong_flag_rd <= ping_pong_flag_rd;//保持
						end
						
						{1'b0, 1'b0}: begin
							//写指令保持
							ui_en <= 1'b1;
							ui_cmd <= CMD_WR;
							ui_addr_reg <= ui_addr_reg;
							
							//MIG写地址保持
							ddr4_wr_addr <= ddr4_wr_addr;
							
							//写数据保持
							ui_wdf_wren <= 1'b1;
							ui_wdf_data <= ui_wdf_data;
							
							//状态保持
							state <= state;
							
							ping_rd_en <= 1'b0;
							pong_rd_en <= 1'b0;
							ping_pong_flag_rd <= ping_pong_flag_rd;//保持
						end
					endcase
					
					ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
				end
				
				WR_WAIT_DATA: begin
					//指令已完成，等待MIG接收写数据
					//当状状态下ui_en值为0，ui_wdf_wren值为1
					case (ui_wdf_rdy)
						1'b1: begin
							case (cnt_data)//判断数据计数
								WR_BLK: begin
									//1轮写操作结束
									
									//指令结束
									ui_en <= 1'b0;
									ui_cmd <= CMD_RD;
									ui_addr_reg <= 25'd0;
									
									//MIG写地址保持
									ddr4_wr_addr <= ddr4_wr_addr;
									
									//写数据结束
									ui_wdf_wren <= 1'b0;
									ui_wdf_data <= 128'd0;
									
									//状态转移
									state <= IDLE;
									
									ping_rd_en <= 1'b0;
									pong_rd_en <= 1'b0;
									ping_pong_flag_rd <= 1'b0;
								end
								
								default: begin
									//更新下个指令
									ui_en <= 1'b1;
									ui_cmd <= CMD_WR;
									ui_addr_reg <= ddr4_wr_addr;
									
									//MIG写地址更新
									ddr4_wr_addr <= ddr4_wr_addr+25'd1;
									
									//写数据更新
									ui_wdf_wren <= 1'b1;
									case (ping_pong_flag_rd)
										1'b0: begin
											//读ping
											ui_wdf_data <= ping_dout;
											ping_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b1;
											
											pong_rd_en <= 1'b0;
										end
										
										1'b1: begin
											//读pong
											ui_wdf_data <= pong_dout;
											pong_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b0;
											
											ping_rd_en <= 1'b0;
										end
									endcase
									
									//状态转移
									state <= WR;
								end
							endcase
						end
						
						1'b0: begin
							//指令结束
							ui_en <= 1'b0;
							ui_cmd <= CMD_RD;
							ui_addr_reg <= 25'd0;
							
							//MIG写地址保持
							ddr4_wr_addr <= ddr4_wr_addr;
							
							//写数据保持
							ui_wdf_wren <= 1'b1;
							ui_wdf_data <= ui_wdf_data;
							
							//状态保持
							state <= state;
							
							ping_rd_en <= 1'b0;
							pong_rd_en <= 1'b0;
							ping_pong_flag_rd <= ping_pong_flag_rd;//保持
						end
					endcase
					
					ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
				end
				
				WR_WAIT_CMD: begin
					//写数据已完成，等待MIG接收写指令
					//当前状态ui_wdf_wren值为0，ui_en值为1
					case (ui_rdy)
						1'b1: begin
							case (cnt_cmd)//判断指令计数
								WR_BLK: begin
									//1轮写操作结束
									
									//指令结束
									ui_en <= 1'b0;
									ui_cmd <= CMD_RD;
									ui_addr_reg <= 25'd0;
									
									//MIG写地址保持
									ddr4_wr_addr <= ddr4_wr_addr;
									
									//写数据结束
									ui_wdf_wren <= 1'b0;
									ui_wdf_data <= 128'd0;
									
									//状态转移
									state <= IDLE;
									
									ping_rd_en <= 1'b0;
									pong_rd_en <= 1'b0;
									ping_pong_flag_rd <= 1'b0;
								end
								
								default: begin
									//更新下个指令
									ui_en <= 1'b1;
									ui_cmd <= CMD_WR;
									ui_addr_reg <= ddr4_wr_addr;
									
									//MIG写地址更新
									ddr4_wr_addr <= ddr4_wr_addr+25'd1;
									
									//写数据更新
									ui_wdf_wren <= 1'b1;
									case (ping_pong_flag_rd)
										1'b0: begin
											//读ping
											ui_wdf_data <= ping_dout;
											ping_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b1;
											
											pong_rd_en <= 1'b0;
										end
										
										1'b1: begin
											//读pong
											ui_wdf_data <= pong_dout;
											pong_rd_en <= 1'b1;
											ping_pong_flag_rd <= 1'b0;
											
											ping_rd_en <= 1'b0;
										end
									endcase
									
									//状态转移
									state <= WR;
								end
							endcase
						end
						
						1'b0: begin
							//写数据停止
							ui_wdf_wren <= 1'b0;
							ui_wdf_data <= 128'd0;
							
							//指令保持
							ui_en <= 1'b1;
							ui_cmd <= CMD_WR;
							ui_addr_reg <= ui_addr_reg;
							
							//MIG写地址保持
							ddr4_wr_addr <= ddr4_wr_addr;
							
							//状态保持
							state <= state;
							
							ping_rd_en <= 1'b0;
							pong_rd_en <= 1'b0;
							ping_pong_flag_rd <= ping_pong_flag_rd;//保持
						end
					endcase
					
					ddr4_rd_addr <= ddr4_rd_addr;//MIG读地址保持
				end
				
				default: begin
					state <= IDLE;
			
					ui_en <= 1'b0;
					ui_cmd <= CMD_RD;
					ui_addr_reg <= 25'd0;
					ui_wdf_wren <= 1'b0;
					ui_wdf_data <= 128'd0;
					
					ddr4_wr_addr <= 25'd0;
					ddr4_rd_addr <= 25'd0;
					
					ping_rd_en <= 1'b0;
					pong_rd_en <= 1'b0;
					ping_pong_flag_rd <= 1'b0;
				end
			endcase
		end
	end
	
	//1轮写读操作结束时，更新DDR4可写可读数据量
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			ddr4_2wr <= 25'h1_FFF_FFF;
			ddr4_2rd <= 25'd0;
		end
		else begin
			case (state)
				IDLE,
				RD_CMD: begin
					ddr4_2wr <= ddr4_2wr;
					ddr4_2rd <= ddr4_2rd;
				end
				
				RD_DATA: begin
					case ({cnt_data, ui_rd_data_valid})
						{RD_BLK, 1'b1}: begin
							ddr4_2wr <= ddr4_2wr+{16'd0, RD_BLK};//数据读出，可写数据量增加
							ddr4_2rd <= ddr4_2rd-{16'd0, RD_BLK};//数据读出，可读数据量减小
						end
						
						default: begin
							ddr4_2wr <= ddr4_2wr;
							ddr4_2rd <= ddr4_2rd;
						end
					endcase
				end
				
				WR: begin
					case ({ui_rdy, ui_wdf_rdy, cnt_data})
						{2'b11, WR_BLK}: begin
							ddr4_2wr <= ddr4_2wr-{16'd0, WR_BLK};//数据写入，可写数据量减小
							ddr4_2rd <= ddr4_2rd+{16'd0, WR_BLK};//数据写入，可读数据量增加
						end
						
						default: begin
							ddr4_2wr <= ddr4_2wr;
							ddr4_2rd <= ddr4_2rd;
						end
					endcase			
				end
				
				WR_WAIT_DATA: begin
					case ({ui_wdf_rdy, cnt_data})
						{1'b1, WR_BLK}: begin
							ddr4_2wr <= ddr4_2wr-{16'd0, WR_BLK};//数据写入，可写数据量减小
							ddr4_2rd <= ddr4_2rd+{16'd0, WR_BLK};//数据写入，可读数据量增加
						end
						
						default: begin
							ddr4_2wr <= ddr4_2wr;
							ddr4_2rd <= ddr4_2rd;
						end
					endcase
				end
				
				WR_WAIT_CMD: begin
					case ({ui_rdy, cnt_cmd})
						{1'b1, WR_BLK}: begin
							ddr4_2wr <= ddr4_2wr-{16'd0, WR_BLK};//数据写入，可写数据量减小
							ddr4_2rd <= ddr4_2rd+{16'd0, WR_BLK};//数据写入，可读数据量增加
						end
						
						default: begin
							ddr4_2wr <= ddr4_2wr;
							ddr4_2rd <= ddr4_2rd;
						end
					endcase
				end
				
				default: begin
					ddr4_2wr <= 25'h1_FFF_FFF;
					ddr4_2rd <= 25'd0;
				end
			endcase
		end
	end
	
	//MIG接受数据计数
	always @(posedge clk) begin
		case (state)
			WR,
			WR_WAIT_DATA: begin
				cnt_data <= cnt_data+{8'd0, ui_wdf_rdy};
			end
			
			WR_WAIT_CMD: begin
				cnt_data <= cnt_data;//保持
			end
			
			RD_CMD,
			RD_DATA: begin
				cnt_data <= cnt_data+{8'd0, ui_rd_data_valid};
			end
			
			default: begin
				cnt_data <= 9'd1;
			end
		endcase
	end
	
	//MIG接受指令计数
	always @(posedge clk) begin
		case (state)
			WR,
			WR_WAIT_CMD: begin
				cnt_cmd <= cnt_cmd+{8'd0, ui_rdy};
			end
			
			WR_WAIT_DATA: begin
				cnt_cmd <= cnt_cmd;//保持
			end
			
			RD_CMD: begin
				//当前状态ui_en固定为1，只判断ui_rdy即表示指令被接受
				cnt_cmd <= cnt_cmd+{8'd0, ui_rdy};
			end
			
			default: begin
				cnt_cmd <= 9'd1;
			end
		endcase
	end
	
	//读出数据写入读FIFO
	always @(posedge clk) begin
		case (state)
			RD_CMD,
			RD_DATA: begin
				rd_wr_en <= ui_rd_data_valid;
				rd_din <= ui_rd_data;
			end
			
			default: begin
				rd_wr_en <= 1'b0;
				rd_din <= 128'd0;
			end
		endcase
	end
	
	//模块写接口数据进入写FIFO
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			ping_pong_flag_wr <= 1'b0;
			ping_din <= 128'd0;
			ping_wr_en <= 1'b0;
			pong_din <= 128'd0;
			pong_wr_en <= 1'b0;
		end
		else begin
			case ({wr_en, ping_pong_flag_wr})
				{1'b1, 1'b0}: begin
					//写入ping
					ping_din <= wr_data;
					ping_wr_en <= 1'b1;
					
					pong_din <= pong_din;
					pong_wr_en <= 1'b0;
					
					ping_pong_flag_wr <= 1'b1;//切换
				end
				
				{1'b1, 1'b1}: begin
					//写入pong
					pong_din <= wr_data;
					pong_wr_en <= 1'b1;
					
					ping_din <= ping_din;
					ping_wr_en <= 1'b0;
					
					ping_pong_flag_wr <= 1'b0;//切换
				end
				
				default: begin
					ping_pong_flag_wr <= ping_pong_flag_wr;//保持
					ping_din <= ping_din;
					ping_wr_en <= 1'b0;
					pong_din <= pong_din;
					pong_wr_en <= 1'b0;
				end
			endcase
		end
	end
	
	//模块可读可写标记
	reg wr_able = 1'b0;
	reg rd_able = 1'b0;
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			wr_able <= 1'b1;
			rd_able <= 1'b0;
		end
		else begin
			if (pong_2wr >= WR_BLK) begin
				wr_able <= 1'b1;
			end
			else begin
				wr_able <= 1'b0;
			end
			
			if (rd_2rd >= RD_BLK) begin
				rd_able <= 1'b1;
			end
			else begin
				rd_able <= 1'b0;
			end
		end
	end
	
	
endmodule
