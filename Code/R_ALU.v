// 190154 Anmol Pabla   190620 Pranab Pandey
module R_ALU(inst_reg, ALU_I1, ALU_I2, shift, ALU_out);
    
    input[31:0] inst_reg;
    input [4:0] shift;
    input [31:0] ALU_I1, ALU_I2;
    output reg[31:0] ALU_out;


    always@(*)
    begin
      if(inst_reg[31:26]==0) begin
          
          case(inst_reg[5:0])
          32: // add
            ALU_out = ALU_I1 + ALU_I2 ; 
          33: // sub
            ALU_out = ALU_I1 - ALU_I2 ;
          34: // addu
            ALU_out = ALU_I1 + ALU_I2 ;
          35: // subu
            ALU_out = ALU_I1 - ALU_I2 ;
          36: // and
            ALU_out = ALU_I1 & ALU_I2;
          37: // or
            ALU_out = ALU_I1 | ALU_I2;
          38: // sll
            ALU_out = ALU_I1<<shift;
          39: // srl
            ALU_out = ALU_I1>>shift;
          40: //  slt 
            ALU_out = (ALU_I1<ALU_I2)?1:0;
          default: ALU_out = 32'b00000000000000000000000000000000;
          endcase
      end

    end


endmodule