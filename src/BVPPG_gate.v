module BVPPG_gate (
    input  wire A,   
    input  wire B,  
    input  wire C,
	 input  wire D,
	 input  wire E,
    output reg P,
	 output reg Q, 
	 output reg R,
	 output reg S,
	 output reg T
);

wire [1:0]X;

buf b1(P, A);
buf b2(Q, B);
and a1(X[0], A, B);
xor x1(R, X[0], C);
buf b3(S, D);
and a2(X[1], A, D);
xor x3(T, X[1], E);

   
endmodule
