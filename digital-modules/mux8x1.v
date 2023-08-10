`ifndef MUX8X1
`define MUX8X1

module mux8x1 (
    input wire [w-1:0] d0,
    input wire [w-1:0] d1,
    input wire [w-1:0] d2,
    input wire [w-1:0] d3,
    input wire [w-1:0] d4,
    input wire [w-1:0] d5,
    input wire [w-1:0] d6,
    input wire [w-1:0] d7,
    input wire [2:0] sel,
    output reg [w-1:0] F 
);
    
    parameter w = 1; //width

    always @(*) begin
        case (sel)
            0: F = d0;
            1: F = d1;
            2: F = d2;
            3: F = d3;
            4: F = d4;
            5: F = d5;
            6: F = d6;
            default: F = d7;
        endcase
    end

endmodule

`endif