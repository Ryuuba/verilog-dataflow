`ifndef D_FLIP_FLOP_E_V
`define D_FLIP_FLOP_E_V

module d_flip_flop_e (
    input wire D,
    input wire E,
    input wire RST,
    input wire CLK,
    output reg Q,
    output reg Q_neg
);
    
    // behavioral description
    always @(posedge CLK, posedge RST) begin
        if (RST) begin
            Q <= 0;
            Q_neg <= 1;
        end
        else if (E) begin
            Q <= D;
            Q_neg <= ~D;
        end
    end

endmodule

`endif