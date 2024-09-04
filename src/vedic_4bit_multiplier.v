// 4x4 Vedic Multiplier used for partial products
module vedic_4bit_multiplier (
    input  wire [3:0] A, // 4-bit input A
    input  wire [3:0] B, // 4-bit input B
    output  [7:0] P  // 8-bit output product
);

    // Intermediate partial products
    wire [3:0] P0, P1, P2, P3;
    wire temp;

    // 2x2 Vedic Multipliers for 4x4 multiplication
    vedic_2bit_multiplier U0 (A[1:0], B[1:0], P0[3:0]);
    vedic_2bit_multiplier U1 (A[1:0], B[3:2], P1[3:0]);
    vedic_2bit_multiplier U2 (A[3:2], B[1:0], P2[3:0]);
    vedic_2bit_multiplier U3 (A[3:2], B[3:2], P3[3:0]);

    buf b[1:0](P[1:0], P0[1:0]);
    reversible_6bit_adder a1({P3, P0[3:2]}, {2'b0, P2}, {2'b0, P1}, P[7:2], temp);
    wire _unused = &{temp};

endmodule
