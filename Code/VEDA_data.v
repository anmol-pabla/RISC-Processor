// 190154 Anmol Pabla   190620 Pranab Pandey
module VEDA_data(clk, w_en, mode, address, datain, dataout);
    // stores data
    input clk, w_en, mode;
    input [8:0] address;
    input [31:0] datain;
    output reg [31:0] dataout;

    integer i;    
    reg [31:0] RF[99:0];           

    initial begin
        for(i=0;i<100;i=i+1)
            RF[i] = 32'b00000000000000000000000000100000;
        RF[0] = 32'b00000000000000000000000000000011;
        RF[1] = 32'b00000000000000000000000000000010;
        RF[2] = 32'b00000000000000000000000000000001;
        RF[3] = 32'b00000000000000000000000000000101;
        RF[4] = 32'b00000000000000000000000000000100;
    end
    
    always@(*)
    begin
        $monitor(RF[0], RF[1], RF[2], RF[3], RF[4]);    // pronting data
        if (mode==0) begin
                if(w_en) begin
                    RF[address]<=datain; 
                end
                dataout<=datain;
            end 

        else begin
                dataout<=RF[address];
            end
    end

endmodule