module test(
	input clk,//IP用户接口时钟
	input rst,//IP用户接口复位

	output wr_en,//写使能
	input wr_able,//可写标记
	output [127:0] wr_data,//写数据

	output rd_en,//读使能
	input rd_able,//可读标记
	input [127:0] rd_data,//读数据
	input rd_data_valid//读数据有效标记
    );
	
	reg [9:0] cnt = 10'd1;
	
	localparam HOLD = 4'b1111;
	localparam WAIT_WR = 4'b0001;
	localparam WR = 4'b0010;
	localparam WAIT_RD = 4'b0100;
	localparam RD = 4'b1000;
	reg [3:0] state = HOLD;
	
	reg wr_en = 1'b0;
	reg [127:0] wr_data = 128'd0;
	reg rd_en = 1'b0;
	
	reg [63:0] cnt_hold = 64'd0;
	
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			state <= HOLD;
			wr_en <= 1'b0;
			rd_en <= 1'b0;
			wr_data <= 128'd0;
			cnt <= 10'd1;
			cnt_hold <= 64'd0;
		end
		else begin
			case (state)
				HOLD: begin
					case (cnt_hold)
						// 64'd30_000_000: begin
						64'd10: begin
							cnt_hold <= 64'd0;
							
							if (rd_able == 1'b1) begin//读优先
								state <= WAIT_RD;
							end
							else if (wr_able == 1'b1) begin
								state <= WAIT_WR;
							end
							else begin
								state <= state;
							end
						end
						
						default: begin
							cnt_hold <= cnt_hold+64'd1;
							state <= state;
						end
					endcase
				end
				
				WAIT_WR: begin
					if (wr_able == 1'b1) begin
						wr_en <= 1'b1;
						wr_data <= 128'd1;
						state <= WR;
					end
					else begin
						wr_en <= 1'b0;
						wr_data <= 128'd0;
						state <= state;
					end
					
					rd_en <= 1'b0;
					cnt <= 10'd1;
				end
				
				WR: begin
					case (cnt)
						10'd200: begin
							wr_en <= 1'b0;
							wr_data <= 128'd0;
							
							state <= WAIT_RD;
							
							cnt <= 10'd1;
						end
						
						default: begin
							wr_en <= 1'b1;
							wr_data <= {16{cnt[7:0]}};
							
							state <= state;
							
							cnt <= cnt+10'd1;
						end
					endcase
					
					rd_en <= 1'b0;
				end
				
				WAIT_RD: begin
					if (rd_able == 1'b1) begin
						rd_en <= 1'b1;
						state <= RD;
					end
					else begin
						rd_en <= 1'b0;
						state <= state;
					end
					
					wr_en <= 1'b0;
					wr_data <= 128'd0;
					cnt <= 10'd1;
				end
				
				RD: begin
					case (cnt)
						10'd128: begin
							rd_en <= 1'b0;
							
							cnt <= 10'd1;
							state <= HOLD;
						end
						
						default: begin
							rd_en <= 1'b1;
							
							cnt <= cnt+10'd1;
							state <= state;
						end
					endcase
					
					wr_en <= 1'b0;
					wr_data <= 128'd0;
				end
				
				default: begin
					state <= HOLD;
					wr_en <= 1'b0;
					rd_en <= 1'b0;
					wr_data <= 128'd0;
					cnt <= 10'd1;
					cnt_hold <= 64'd0;
				end
			endcase
		end
	end

	//读数据比较
	(*keep = "TRUE"*) reg [31:0] cnt_err = 32'd0;
	reg [9:0] cnt_valid = 10'd0;//0~127计数，1轮读数据计数
	reg [9:0] cnt_compare = 10'd0;//0~199计数，用于读出数据比较，写入数据为[1，01~C7]循环
	
	always @(posedge clk) begin
		case ({cnt_valid, rd_data_valid})
			{10'd127, 1'b1}: begin
				//读完1轮数据
				cnt_valid <= 10'd0;
				
				case (cnt_compare)
					10'd0: begin
						if (rd_data != 128'd1) begin
							cnt_err <= cnt_err+32'd1;
						end
						else begin
							cnt_err <= cnt_err;
						end
						
						cnt_compare <= 10'd1;
					end
					
					default: begin
						if ((rd_data[7:0] != cnt_compare[7:0]) || 
						(rd_data[15:8] != cnt_compare[7:0]) || 
						(rd_data[23:16] != cnt_compare[7:0]) || 
						(rd_data[31:24] != cnt_compare[7:0]) || 
						(rd_data[39:32] != cnt_compare[7:0]) || 
						(rd_data[47:40] != cnt_compare[7:0]) || 
						(rd_data[55:48] != cnt_compare[7:0]) || 
						(rd_data[63:56] != cnt_compare[7:0]) || 
						(rd_data[71:64] != cnt_compare[7:0]) || 
						(rd_data[79:72] != cnt_compare[7:0]) || 
						(rd_data[87:80] != cnt_compare[7:0]) || 
						(rd_data[95:88] != cnt_compare[7:0]) || 
						(rd_data[103:96] != cnt_compare[7:0]) || 
						(rd_data[111:104] != cnt_compare[7:0]) || 
						(rd_data[119:112] != cnt_compare[7:0]) || 
						(rd_data[127:120] != cnt_compare[7:0])) begin
							cnt_err <= cnt_err+32'd1;
						end
						else begin
							cnt_err <= cnt_err;
						end
						
						case (cnt_compare)
							10'd199: begin
								cnt_compare = 10'd0;
							end
							
							default: begin
								cnt_compare <= cnt_compare+10'd1;
							end
						endcase
					end
				endcase
			end
			
			default: begin
				if (rd_data_valid == 1'b1) begin
					case (cnt_compare)
						10'd0: begin
							if (rd_data != 128'd1) begin
								cnt_err <= cnt_err+32'd1;
							end
							else begin
								cnt_err <= cnt_err;
							end
							
							cnt_compare <= 10'd1;
						end
						
						default: begin
							if ((rd_data[7:0] != cnt_compare[7:0]) || 
							(rd_data[15:8] != cnt_compare[7:0]) || 
							(rd_data[23:16] != cnt_compare[7:0]) || 
							(rd_data[31:24] != cnt_compare[7:0]) || 
							(rd_data[39:32] != cnt_compare[7:0]) || 
							(rd_data[47:40] != cnt_compare[7:0]) || 
							(rd_data[55:48] != cnt_compare[7:0]) || 
							(rd_data[63:56] != cnt_compare[7:0]) || 
							(rd_data[71:64] != cnt_compare[7:0]) || 
							(rd_data[79:72] != cnt_compare[7:0]) || 
							(rd_data[87:80] != cnt_compare[7:0]) || 
							(rd_data[95:88] != cnt_compare[7:0]) || 
							(rd_data[103:96] != cnt_compare[7:0]) || 
							(rd_data[111:104] != cnt_compare[7:0]) || 
							(rd_data[119:112] != cnt_compare[7:0]) || 
							(rd_data[127:120] != cnt_compare[7:0])) begin
								cnt_err <= cnt_err+32'd1;
							end
							else begin
								cnt_err <= cnt_err;
							end
							
							case (cnt_compare)
								10'd199: begin
									cnt_compare = 10'd0;
								end
								
								default: begin
									cnt_compare <= cnt_compare+10'd1;
								end
							endcase
						end
					endcase
					
					cnt_valid <= cnt_valid+10'd1;
				end
				else begin
					cnt_valid <= cnt_valid;
					cnt_err <= cnt_err;
					cnt_compare <= cnt_compare;
				end
			end
		endcase
	end

endmodule
