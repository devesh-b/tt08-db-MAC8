module MAC8(
    input [7:0] A,
    input SYS_CLK, SYS_RST,
    inout C[7:0],
    output reg [7:0] Accumulator
);

wire [15:0] W, Sum;
wire temp;
reg [7:0] int;

vedic_8bit_multiplier m1(A, C, W);


always @(posedge SYS_CLK or negedge SYS_RST) begin
    if (!SYS_RST) begin
        int <= 8'b0;
    end else begin
        int <= C;
    end
end

always @(negedge SYS_CLK or negedge SYS_RST) begin
    if (!SYS_RST) begin
        {Accumulator, C} <= 16'b0;
    end else begin
        {Accumulator, C} <= Sum;
    end
end

reversible_16bit_adder a1 (
    {Accumulator, int},
    W,
    1'b0,      // Assuming the adder has a carry-in input
    Sum,
    temp      // Assuming the adder has a carry-out output
);

endmodule

