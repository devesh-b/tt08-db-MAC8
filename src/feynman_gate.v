module feynman_gate (
    input  wire A,   
    input  wire B,    
    output reg P,
	 output reg Q 
);

buf b1(P, A);
xor x1(Q, A, B);
   
endmodule
