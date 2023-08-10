`include "../d-flip-flop-e.v"
`timescale 1s/100ms

module testbench;

    // input signals
    reg data_in, clk, e, rst;

    // output signals
    wire q, q_neg;

    // module instance
    d_flip_flop_e dffe(data_in, e, rst, clk, q, q_neg);

    // clock generation
    localparam CLK_PERIOD = 2;
    always #(CLK_PERIOD/2) clk=~clk;

    // Simulation results
    initial begin
        $dumpfile("dffe-tb.vcd");
        $dumpvars(0, testbench);
    end

    // simulation result generator
    integer i;
    initial begin
        rst <= 1'bx; clk <= 1'bx;
        #(CLK_PERIOD*2) rst <= 1;
        #(CLK_PERIOD*2) rst <= 0; clk <= 0; data_in <= 1; e <= 1;
        for (i = 0; i < 4; i=i+1)
            #(CLK_PERIOD) data_in <= ~data_in;
        e <= 0;
        for (i = 0; i < 4; i=i+1)
            #(CLK_PERIOD) data_in <= ~data_in;
        $finish(2);
    end

endmodule