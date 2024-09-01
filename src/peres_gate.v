module peres_gate (
    input  wire A,   
    input  wire B,  
    input  wire C,   
    output reg P,
	 output reg Q, 
	 output reg R     
);

wire X;

buf b1(P, A);
xor x1(Q, A, B);
and a1(X, A, B);
xor x2(R, X, C);

   
endmodule
