module vedic_2bit_multiplier(
    input wire [1:0] A, B,
    output reg [3:0] P
);

	 wire g[4:0];
	 wire i[3:1];
	 wire a[3:0];
	 
	 BVPPG_gate b1(A[0], B[0], 1'b0, B[1], 1'b0, g[0], i[1], P[0], i[2], a[0]);
	 peres_gate p1(A[1], i[1], 1'b0, i[3], g[1], a[1]);
	 peres_gate p2(i[3], i[2], 1'b0, g[2], g[3], a[2]);
	 peres_gate p3(a[0], a[1], 1'b0, g[4], P[1], a[3]);
	 feynman_gate f1(a[3], a[2], P[3], P[2]);
	 

endmodule
