// 190154 Anmol Pabla   190620 Pranab Pandey
module I_ALU_tb();
    reg [31:0] inst_reg;
    reg [31:0] ALU_I1;
    reg [15:0] ALU_I2;
    wire[31:0] ALU_out;

    I_ALU uut(inst_reg, ALU_I1, ALU_I2, ALU_out);

    initial begin
        $monitor(ALU_out);
        inst_reg = 32'b00100000000000000000000000100000;
        ALU_I1 = 1;
        ALU_I2 = 2;
        #20
        inst_reg = 32'b00101000000000000000000000100000;
        ALU_I1 = 2;
        ALU_I2 = 1;
        #20
        $finish;
    end

endmodule