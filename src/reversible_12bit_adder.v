module reversible_12bit_adder (
    input  wire [11:0] A,   // 6-bit input A
    input  wire [11:0] B,   // 6-bit input B
    input  wire [11:0] C,   // 6-bit input C
    output reg [11:0] Sum, // 6-bit Sum
    output reg       Carry // 6-bit Carry
);

// Intermediate wires for full adders
wire [11:0] sum1, carry1;
wire [11:0] carry2;
wire temp;

// First stage of full adders
reversible_full_adder fa[11:0](A[11:0], B[11:0], C[11:0], 1'b0, sum1[11:0], carry1[11:0]);

buf b1(Sum[0], sum1[0]);


// Second stage of full adders
reversible_6bit_adder fa13(sum1[6:1], carry1[5:0], {carry2[4:0],1'b0}, Sum[6:1], carry2[5]);
reversible_6bit_adder fa14({1'b0, sum1[11:7]}, carry1[11:6], carry2[10:5], {Carry, Sum[11:7]}, carry2[11]);


endmodule
