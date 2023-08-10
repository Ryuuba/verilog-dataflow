`ifndef UNIVERSAL_REG_VL
`define UNIVERSAL_REG_VL

module universalRegister (
    input wire SerialIn,
    input wire [n-1:0] D,
    input wire [2:0] ctrl,
    input wire clk,
    input wire rst_n,
    output wire SerialOut,
    output reg [n-1:0] Q
);

    parameter n = 4;

    // Behavioral description
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            Q <= 0;
        else begin
            case (ctrl)
                0: Q <= Q; // hold
                1: Q <= D; // parallel load
                2: Q <= Q + 1; // increment
                3: Q <= Q - 1; // decrement
                4: Q <= Q << 1; // shift left logic
                5: Q <= Q >> 1; // shift right logic
                6: Q <= Q >>> 1; // shift right arithmetic
                default: Q <= -Q; // negative
            endcase
        end
    end

endmodule

`endif