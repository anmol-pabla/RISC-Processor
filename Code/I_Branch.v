// 190154 Anmol Pabla   190620 Pranab Pandey
module I_Branch(clk, inst_reg, PC, reg_1, reg_2, new_PC);
    
    input clk;
    input[31:0] inst_reg;
    input [8:0] PC;
    input [31:0] reg_1, reg_2;
    wire [8:0] one;
    reg [8:0] temp;
    output reg[8:0] new_PC;
    
    reg is_branch;

    assign one = 9'b000000001;

    always@(posedge clk)
    begin
      // $monitor(is_branch);
      if(inst_reg[31:26]>=15 && inst_reg[31:26]<=20) begin

         case(inst_reg[31:26])
            15: // beq
               is_branch = (reg_1==reg_2)?1'b1:1'b0;
            16: // bne
               is_branch = (reg_1!=reg_2)?1'b1:1'b0;
            17: // bgt
               is_branch = (reg_1>reg_2)?1'b1:1'b0;
            18: // bgte
               is_branch = (reg_1>=reg_2)?1'b1:1'b0;
            19: // ble
               is_branch = (reg_1<reg_2)?1'b1:1'b0;
            20: // bleq
               is_branch = (reg_1<=reg_2)?1'b1:1'b0;
            
         endcase

      if(is_branch==1'b1) begin
         new_PC = inst_reg[15:0];   
      end  
      
      else begin
         new_PC = PC;
      end

      end
    
    end


endmodule