// Reversible full adder
module reversible_full_adder (
    input  wire A,     // Input A
    input  wire B,     // Input B
    input  wire Cin,   // Carry-in
	 input  wire Ctrl,
    output reg S,     // Sum
    output reg Cout   // Carry-out
);

wire g[1:0];
wire n[1:0];

peres_gate p1(A, B, Ctrl, g[0], n[0], n[1]);
peres_gate p2(n[0], Cin,  n[1], g[1], S, Cout);

	wire _unused = &{g[1:0]};


endmodule
