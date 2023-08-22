// 190154 Anmol Pabla   190620 Pranab Pandey
module I_Branch_tb();
    reg [31:0] inst_reg;
    reg [8:0] PC;
    reg [31:0] reg_1, reg_2;
    wire[8:0] new_PC;

    I_Branch uut(inst_reg, PC, reg_1, reg_2, new_PC);

    initial begin
        $monitor(new_PC);
        inst_reg = 32'b01000000000000000000000000000011;
        PC = 1;
        reg_1 = 1;
        reg_2 = 2;
        #20
        inst_reg = 32'b01000100000000000000000000000010;
        PC = 1;
        reg_1 = 1;
        reg_2 = 1;
        #20
        $finish;
    end

endmodule