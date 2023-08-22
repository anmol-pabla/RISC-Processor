// 190154 Anmol Pabla   190620 Pranab Pandey
module J_Jump_tb();
    
    reg [31:0] inst_reg;
    reg [8:0] PC;
    reg [31:0] reg_1;
    wire[8:0] new_PC;    
    wire[8:0] J_out;

    J_Jump uut(inst_reg, PC, reg_1, new_PC, J_out);

    initial begin
        $monitor(new_PC, J_out);
        inst_reg = 32'b00000100000000000000000000000011;
        PC = 1;
        reg_1 = 1;
        #20
        inst_reg = 32'b00001100000000000000000000000011;
        PC = 1;
        reg_1 = 1;
        #20
        $finish;
    end

endmodule