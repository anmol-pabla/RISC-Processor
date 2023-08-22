// 190154 Anmol Pabla   190620 Pranab Pandey
module VEDA_data_tb;

    reg clk, w_en, mode;
    reg [8:0] address;
    reg [31:0] datain;
    wire [31:0] dataout;
    
    VEDA_data uut( clk, w_en, mode, address, datain, dataout );

    initial begin
        clk<=0;
        forever #5 clk<=~clk;
    end

    initial begin

        $dumpfile("VEDA_tb.vcd");
        $dumpvars(0,VEDA_tb);
        $monitor ("dataout ->  ", dataout);
 
        #20;

        w_en = 1'b1;
        mode = 1'b0;
        address = 9'b000000101;
        datain = 32'b00000000000000000000000000001001;
            
        #20;

        w_en = 1'b1;
        mode = 1'b1;
        address = 9'b000000001;
        datain = 32'b00000000000000000000000000001001;
            
        #20;

        w_en = 1'b1;
        mode = 1'b1;
        address = 9'b000000101;
        datain = 32'b00000000000000000000000000001001;
            
        #20;

        $finish;
        
    end

endmodule