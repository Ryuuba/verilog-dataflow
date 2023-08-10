`include "../mux8x1.v"
`timescale 1s/100ms

module testbench;

    parameter n = 8;

    // inputs
    reg [n-1:0] data0;
    reg [n-1:0] data1;
    reg [n-1:0] data2;
    reg [n-1:0] data3;
    reg [n-1:0] data4;
    reg [n-1:0] data5;
    reg [n-1:0] data6;
    reg [n-1:0] data7;
    reg [2:0] ctrl;

    //outputs
    wire [n-1:0] f;

    // module instance
    defparam mux8x1_unit.w = n;
    mux8x1 mux8x1_unit(
        data0, data1, data2, data3, data4, data5, data6, data7, 
        ctrl, f
    );

    // simulation results
    initial begin
        $dumpfile("mux8x1.vcd");
        $dumpvars(0, testbench);
    end

    integer i;
    initial begin
        data0 <= 8'b1000_0000;
        data1 <= 8'b0100_0000;
        data2 <= 8'b0010_0000;
        data3 <= 8'b0001_0000;
        data4 <= 8'b0000_1000;
        data5 <= 8'b0000_0100;
        data6 <= 8'b0000_0010;
        data7 <= 8'b0000_0001;
        for (i=0; i<8; i=i+1) begin
            ctrl = i;
            #1;
        end
        $finish(2);
    end
    

endmodule