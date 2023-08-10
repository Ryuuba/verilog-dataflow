`include "universal_reg.v"
`timescale 1s/100ms

module tb_universal_reg;

    parameter m = 4;

    //Module inputs
    reg clk, serial_in, rst_n;
    reg[3:0] D_in;
    reg[2:0] ctrl;

    //Module outputs
    wire serial_out;
    wire [3:0] Q_out;

    //universal register module
    defparam ur.n = m;
    universalRegister ur (
        serial_in,
        D_in,
        ctrl,
        clk,
        rst_n,
        serial_out,
        Q_out
    );

    // clock generation
    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) clk=~clk;

    // Simulation results
    initial begin
        $dumpfile("tb_universal_reg.vcd");
        $dumpvars(0, tb_universal_reg);
    end

    integer i; //iterator

    // Simulation
    initial begin
        rst_n<=1'bx;clk<=1'bx;
        #(CLK_PERIOD*3) rst_n<=1;
        #(CLK_PERIOD*3) rst_n<=0;clk<=0;D_in<=4'b0011;serial_in<=0;
        repeat(5) @(posedge clk);
        rst_n<=1;
        for (i = 0; i < 8; i=i+1) begin
            #(CLK_PERIOD) ctrl <= i[2:0];
        end
        @(posedge clk);
        repeat(2) @(posedge clk);
        $finish(2);
    end

endmodule
`default_nettype wire