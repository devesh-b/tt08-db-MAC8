module reversible_4bit_adder (
    input  wire [3:0] A,   // 6-bit input A
    input  wire [3:0] B,   // 6-bit input B
    input  wire       Cin,   // 6-bit input C
    output reg [3:0] Sum, // 6-bit Sum
    output reg       Carry // 6-bit Carry
);

// Intermediate wires for full adders
wire [2:0] C;

// First stage of full adders
reversible_full_adder fa[3:0](A[3:0], B[3:0], {C[2:0], Cin}, 1'b0, Sum[3:0], {Carry, C[2:0]});


endmodule
