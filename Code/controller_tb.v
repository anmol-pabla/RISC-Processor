// 190154 Anmol Pabla   190620 Pranab Pandey
module controller_tb;
    reg clk, en;
	reg [8:0] PC;
	wire [31:0] inst_reg;
	wire [2:0] seg;

    controller uut(clk, en, PC, inst_reg, seg);

    initial begin
        clk<=0;
        forever #5 clk<=~clk;
    end

    initial begin
        en = 0;
        #40
        en=1;
        PC=0;
        #30
        PC=1;
        #30
        PC=2;
        #30
        $finish;
    end
endmodule