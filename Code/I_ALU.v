// 190154 Anmol Pabla   190620 Pranab Pandey
module I_ALU(inst_reg, ALU_I1, ALU_I2, ALU_out);
    
    input[31:0] inst_reg;
    input [31:0] ALU_I1;
    input [15:0] ALU_I2;
    output reg[31:0] ALU_out;

    always@(*)
    begin
      if(inst_reg[31:26]>=8 && inst_reg[31:26]<=12) begin
        
          case(inst_reg[31:26])
          8: // addi
            ALU_out = ALU_I1 + ALU_I2 ; 
          9: // addiu
            ALU_out = ALU_I1 + ALU_I2 ;
          10: // andi
            ALU_out = ALU_I1 & ALU_I2 ;
          11: // ori
            ALU_out = ALU_I1 | ALU_I2 ;
          12: // slti
            ALU_out = (ALU_I1<ALU_I2)?1:0;
          default: ALU_out = 32'b00000000000000000000000000000000;
          endcase
      end
    
    end


endmodule