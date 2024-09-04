module reversible_6bit_adder (
    input  wire [5:0] A,   // 6-bit input A
    input  wire [5:0] B,   // 6-bit input B
    input  wire [5:0] C,   // 6-bit input C
    output      [5:0] Sum, // 6-bit Sum
    output            Carry
);

// Intermediate wires for full adders
wire [5:0] sum1, carry1;
wire [5:0] carry2;


// First stage of full adders
reversible_full_adder fa0(A[0], B[0], C[0], 1'b0, sum1[0], carry1[0]);
reversible_full_adder fa1(A[1], B[1], C[1], 1'b0, sum1[1], carry1[1]);
reversible_full_adder fa2(A[2], B[2], C[2], 1'b0, sum1[2], carry1[2]);
reversible_full_adder fa3(A[3], B[3], C[3], 1'b0, sum1[3], carry1[3]);
reversible_full_adder fa4(A[4], B[4], C[4], 1'b0, sum1[4], carry1[4]);
reversible_full_adder fa5(A[5], B[5], C[5], 1'b0, sum1[5], carry1[5]);

buf b1(Sum[0], sum1[0]);

// Second stage of full adders
reversible_full_adder fa7(sum1[1], carry1[0], 1'b0, 1'b0, Sum[1], carry2[0]);
reversible_full_adder fa8(sum1[2], carry1[1], carry2[0], 1'b0, Sum[2], carry2[1]);
reversible_full_adder fa9(sum1[3], carry1[2], carry2[1], 1'b0, Sum[3], carry2[2]);
reversible_full_adder fa10(sum1[4], carry1[3], carry2[2], 1'b0, Sum[4], carry2[3]);
reversible_full_adder fa11(sum1[5], carry1[4], carry2[3], 1'b0, Sum[5], carry2[4]);
reversible_full_adder fa12(1'b0, carry1[5], carry2[4], 1'b0,  Carry, carry2[5]);

	wire _unused = &{carry2[5]};
endmodule
