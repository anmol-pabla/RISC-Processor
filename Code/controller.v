// 190154 Anmol Pabla   190620 Pranab Pandey
module controller (clk, en, PC, inst_reg, seg);

	input en;
	input clk;
	input [8:0] PC;
	output reg [31:0] inst_reg;
	output reg [2:0] seg;
	reg [2:0] state;
	reg [2:0] next_state;

	parameter reset = 3'b000, fetch = 3'b010, decode = 3'b100;

	reg w_en, mode;
	reg[31:0] datain;
	wire[31:0] cur_inst;

	VEDA_inst V(clk, w_en, mode, PC, datain, cur_inst);      

	initial begin
			state = reset;
			next_state = fetch;
			w_en = 1;
			mode = 1;
			datain = 32'b00000000000000000000000000000000;
	end

	always@(posedge clk)
	begin
		
		if ( en == 0 ) begin
		state = reset;
		end
		else if (en == 1) begin
		state = next_state;
		end
	end

	// output using enable and inst_reg
	always@(*)
	begin
		// $monitor("cu ", PC,en, " ",inst_reg, " ",state, " ", seg);
		if ( en == 0 ) begin
			seg = 7;
		end

		else begin
			
			case(state)
				reset: 	begin
					seg = 7;
					next_state = fetch;
				end

				fetch:	begin
					inst_reg = cur_inst;
					next_state = decode;
					end

				decode:begin
						if(inst_reg[31:26]==0) begin
							seg = 0;                                                // R-type ALU instruction
						end
					
						else if(inst_reg[31:26]>=8 && inst_reg[31:26]<=12) begin
							seg = 1;                                                // I-type ALU instruction
						end
					
						else if(inst_reg[31:26]==13) begin
							seg = 2;                                                // I-type load, data transfer
						end
					
						else if(inst_reg[31:26]==14) begin
							seg = 3;                                                // I-type store, data transfer
						end
					
						else if(inst_reg[31:26]>=15 && inst_reg[31:26]<=20) begin
							seg = 4;                                                // I-type branch
						end
					
						else if(inst_reg[31:26]>=1 && inst_reg[31:26]<=3) begin
							seg = 5;                                                // J-type jump
						end
					
						else begin
							seg = 7;                                                // Invalid for given ISA architecture
						end

						next_state = reset;
					end
					
				default: begin
					seg = 7;
					next_state = reset;
					end
			endcase
		end
	end
endmodule
