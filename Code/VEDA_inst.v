// 190154 Anmol Pabla   190620 Pranab Pandey
module VEDA_inst(clk, w_en, mode, address, datain, dataout);
    // stores intstructions
    input clk, w_en, mode;
    input [8:0] address;
    input [31:0] datain;
    output reg [31:0] dataout;

    integer i;    
    reg [31:0] RF[199:0];           

    initial begin
        for(i=0;i<200;i=i+1)
            RF[i] = 32'b11111100000000010000100000100000;

        RF[0] = 32'b00100011110111100000000000000000;			// loopm1
        RF[1] = 32'b001000_10110_01101_0000000000000000;			// loop
        RF[2] = 32'b000000_10100_01101_01101_00000_100000;
        RF[3] = 32'b001101_01101_01110_0000000000000000;
        RF[4] = 32'b001101_01101_01111_0000000000000001;
        RF[5] = 32'b010001_01111_01110_0000000000001000;        // go to update
        RF[6] = 32'b001110_01101_01111_0000000000000000;
        RF[7] = 32'b001110_01101_01110_0000000000000001;

        RF[8] = 32'b001000_11110_11110_0000000000000000;		    // updatem1
        RF[9] = 32'b001000_10110_10110_0000000000000001;			// update
        RF[10] = 32'b000000_10111_10101_11000_00000_100001;
        RF[11] = 32'b010000_10110_11000_0000000000000000;       // go to loop
        RF[12] = 32'b001000_10101_10101_0000000000000001;
        RF[13] = 32'b001000_00000_10110_0000000000000000;
        RF[14] = 32'b010000_10101_10111_0000000000000000;       // go to loop

        // RF[0] = 32'b00100000000000000000000000000001;
            // RF[0] = 32'b00110100000_000010000000000000000;
            // RF[1] = 32'b000000_00001_00010_00011_00000_100000;
            // RF[2] = 32'b00111000000_000110000000000000000;
            // RF[3] = 32'b00110100000_000010000000000000000;
        // RF[3] = 32'b00111100001_000000000000000100000;
        // RF[33] = 32'b00111100001_000000000000000100000;
        
    end
    
    always@(*)
    begin
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