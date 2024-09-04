module reversible_12bit_adder (
    input  wire [11:0] A,   // 12-bit input A
    input  wire [11:0] B,   // 12-bit input B
    input  wire [11:0] C,   // 12-bit input C
    output      [11:0] Sum  // 12-bit Sum
);

// Intermediate wires for full adders
wire [11:0] sum1, carry1;
wire [2:0] carry2;

// First stage of full adders
reversible_full_adder fa[11:0](A[11:0], B[11:0], C[11:0], 1'b0, sum1[11:0], carry1[11:0]);

assign Sum[0] = sum1[0];


// Second stage of full adders
    reversible_6bit_adder fa13(sum1[6:1], carry1[5:0], 6'b0, Sum[6:1], carry2[0]);
    reversible_6bit_adder fa14({1'b0, sum1[11:7]}, carry1[11:6], {5'b0,carry2[0]}, {carry2[2], Sum[11:7]}, carry2[1]);

    wire _unused = &{carry2[2:1]};
endmodule
