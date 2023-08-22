// 190154 Anmol Pabla   190620 Pranab Pandey
module J_Jump(inst_reg, PC, reg_1, new_PC, J_out);

    input [31:0] inst_reg;
    input [8:0] PC;
    input [31:0] reg_1;
    output reg[8:0] new_PC;    
    output reg[8:0] J_out;


    always@(*)
    begin
        if(inst_reg[31:26]>=1 && inst_reg[31:26]<=3) begin
            if(inst_reg[31:26]==1) begin // j
                J_out = PC;
                new_PC = inst_reg[25:0];
            end
            if(inst_reg[31:26]==2) begin // jr
                J_out = PC;
                new_PC = reg_1;
            end
            if(inst_reg[31:26]==3) begin //jal
                J_out = PC + 1;
                new_PC = inst_reg[25:0];
            end
        end
    end
endmodule