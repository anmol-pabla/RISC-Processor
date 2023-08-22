// 190154 Anmol Pabla   190620 Pranab Pandey
module cse_bubble_tb;

    reg clk, en;

    cse_bubble uut(clk, en);

    initial begin 
        clk<=0;
        forever #5  clk <= ~clk;
    end

    initial begin
        en = 1;
        #2100
        $finish;
    end

endmodule