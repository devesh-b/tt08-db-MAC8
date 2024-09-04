module reversible_6bit_adder (
    input  wire [5:0] A,   // 6-bit input A
    input  wire [5:0] B,   // 6-bit input B
    input  wire [5:0] C,   // 6-bit input C
    output      [5:0] Sum // 6-bit Sum
);

// Intermediate wires for full adders
wire [5:0] sum1, carry1;
wire [6:0] carry2;


// First stage of full adders
reversible_full_adder fa[5:0](A[5:0], B[5:0], C[5:0], 1'b0, sum1[5:0], carry1[5:0]);

    assign Sum[0] = sum1[0];

// Second stage of full adders
reversible_full_adder fa7(sum1[1], carry1[0], 1'b0, 1'b0, Sum[1], carry2[0]);
reversible_full_adder f[11:8](sum1[5:2], carry1[4:1], carry2[3:0], 1'b0, Sum[5:2], carry2[4:1]);
reversible_full_adder fa12(1'b0, carry1[5], carry2[4], 1'b0,  carry2[6], carry2[5]);


endmodule
