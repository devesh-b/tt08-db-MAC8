module reversible_4bit_adder (
    input  wire [3:0] A,   // 6-bit input A
    input  wire [3:0] B,   // 6-bit input B
    input  wire       Cin,   // 6-bit input C
    output reg [3:0] Sum, // 6-bit Sum
    output reg       Carry // 6-bit Carry
);

// Intermediate wires for full adders
wire [2:0] C;

// Instantiation of reversible full adders
    reversible_full_adder fa0 (A[0], B[0], Cin,  1'b0, Sum[0], C[0]);
    reversible_full_adder fa1 (A[1], B[1], C[0], 1'b0, Sum[1], C[1]);
    reversible_full_adder fa2 (A[2], B[2], C[1], 1'b0, Sum[2], C[2]);
    reversible_full_adder fa3 (A[3], B[3], C[2], 1'b0, Sum[3], Carry);

endmodule
