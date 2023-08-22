// 190154 Anmol Pabla   190620 Pranab Pandey
module cse_bubble(clk, en);
    
    input clk, en;

    reg [8:0]PC;
    wire [31:0] inst_reg;
    wire [2:0] seg;

    reg veda_en, veda_mode;
    reg [8:0] veda_address;
    reg [31:0] veda_datain;
    wire [31:0] veda_dataout;

    reg [31:0] I_ALU_I1;
    reg [15:0] I_ALU_I2;
    wire [31:0] I_ALU_out;

    reg [4:0] R_ALU_shift;
    reg [31:0] R_ALU_I1, R_ALU_I2;
    wire[31:0] R_ALU_out;

    reg [31:0] IB_reg_1, IB_reg_2;
    wire [8:0] IB_new_PC;
    
    reg [31:0] JJ_reg_1;
    wire [8:0] JJ_new_PC;    
    wire [8:0] J_out;

    reg [31:0] registers[31:0];

    integer i;
    initial begin
        PC = 0;
        for(i=0;i<32;i=i+1)
            registers[i] = 32'b00000000000000000000000000000000;
        registers[23]=4;
    end

    controller C(clk, en, PC, inst_reg, seg);

    VEDA_data V(clk, veda_en, veda_mode, veda_address, veda_datain, veda_dataout);
    I_ALU IA(inst_reg, I_ALU_I1, I_ALU_I2, I_ALU_out);
    R_ALU RA(inst_reg, R_ALU_I1, R_ALU_I2, R_ALU_shift, R_ALU_out);
    I_Branch IB(clk, inst_reg, PC, IB_reg_1, IB_reg_2, IB_new_PC);
    J_Jump JJ(inst_reg, PC, JJ_reg_1, JJ_new_PC, J_out);
    
    always@(posedge clk)
    begin   
        case(seg)
            0: begin
                R_ALU_I1 = registers[inst_reg[25:21]];
                R_ALU_I2 = registers[inst_reg[20:16]];
                R_ALU_shift = inst_reg[10:6]; #1
                registers[inst_reg[15:11]] = R_ALU_out;
                PC = PC+1;                                                  // R-type ALU instruction
            end
            
            1: begin
                I_ALU_I1 = registers[inst_reg[25:21]];
                I_ALU_I2 = inst_reg[15:0]; #1
                registers[inst_reg[20:16]] = I_ALU_out;
                PC = PC+1;                                                   // I-type ALU instruction
            end
            
            2:  begin
                veda_en = 1;
                veda_mode = 1;
                veda_address = registers[inst_reg[25:21]] + inst_reg[15:0];
                veda_datain = 0; #1
                registers[inst_reg[20:16]] = veda_dataout; 
                PC = PC+1;                                                    // I-type load, data transfer
            end
            
            3:  begin
                veda_en = 1;
                veda_mode = 0;
                veda_address = registers[inst_reg[25:21]] + inst_reg[15:0];
                veda_datain = registers[inst_reg[20:16]];
                PC = PC+1;                                                    // I-type store, data transfer
            end
            
            4: begin
                IB_reg_1 = registers[inst_reg[25:21]];
                IB_reg_2 = registers[inst_reg[20:16]];  #1
                PC = IB_new_PC;                                            // I-type branch
                PC = PC+1;
            end
            
            5: begin
                JJ_reg_1 = registers[inst_reg[25:0]]; #1
                PC  = JJ_new_PC;                                            // J-type jump
            end
            
        endcase
    end

endmodule