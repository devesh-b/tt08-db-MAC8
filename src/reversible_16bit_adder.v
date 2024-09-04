module reversible_16bit_adder (
    input  wire [15:0] A,   // 6-bit input A
    input  wire [15:0] B,   // 6-bit input B
    input  wire        Cin,   // 6-bit input C
    output reg [15:0] Sum
);

// Intermediate wires for full adders
    wire [3:0]C;

// First stge of full adders
    reversible_4bit_adder fa[3:0](A[15:0], B[15:0], {C[2:0], Cin}, Sum[15:0], {C[3:0]});

    wire _unused = &{C[3]};
endmodule
