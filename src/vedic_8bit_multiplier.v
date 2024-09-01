module vedic_8bit_multiplier (
    input  wire [7:0] A, // 8-bit input A
    input  wire [7:0] B, // 8-bit input B
    output reg [15:0] P // 16-bit output product
);

    // Intermediate partial products
    wire [15:0] P0, P1, P2, P3;
	 wire temp;

    // 4x4 multipliers for partial products
    vedic_4bit_multiplier U0 (A[3:0], B[3:0], P0[7:0]);
    vedic_4bit_multiplier U1 (A[3:0], B[7:4], P1[7:0]);
    vedic_4bit_multiplier U2 (A[7:4], B[3:0], P2[7:0]);
    vedic_4bit_multiplier U3 (A[7:4], B[7:4], P3[7:0]);

    buf b[3:0](P[3:0], P0[3:0]);
	 
	 reversible_12bit_adder a1({P3, P0[7:4]}, {4'b0, P2}, {4'b0, P1}, P[15:4], temp);

endmodule

