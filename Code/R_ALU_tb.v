// 190154 Anmol Pabla   190620 Pranab Pandey
module R_ALU_tb();
    reg [31:0] inst_reg;
    reg [4:0] shift;
    reg [31:0] ALU_I1, ALU_I2;
    wire[31:0] ALU_out;

    R_ALU uut(inst_reg, ALU_I1, ALU_I2, shift, ALU_out);

    initial begin
        $monitor(ALU_out);
        inst_reg = 32'b00000000000000000000000000100000;
        ALU_I1 = 1;
        ALU_I2 = 2;
        shift = 0;
        #20
        inst_reg = 32'b00000000000000000000000000100001;
        ALU_I1 = 2;
        ALU_I2 = 1;
        shift = 0;
        #20
        $finish;
    end

endmodule