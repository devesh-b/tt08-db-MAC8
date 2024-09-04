/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_db_MAC (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

reg [7:0] reg_a,reg_b;
wire [15:0] W,Sum;
reg [15:0] Out;


assign uio_oe = clk ? 8'hFF : 8'h00;
  
always @(posedge clk or negedge rst_n) begin
      
        if (!rst_n) begin
            reg_a <= 0;
				reg_b <= 0;
        end else begin
            reg_a<=ui_in;
				reg_b<=uio_in;
        end
    end

vedic_8bit_multiplier m1(reg_a, reg_b, W);
reversible_16bit_adder a1 (
    .A(Out),
    .B(W),
    .Cin(1'b0),      // Assuming the adder has a carry-in input
    .Sum(Sum)     // Assuming the adder has a carry-out output
);

always @(negedge clk or negedge rst_n) begin
	     
        if (!rst_n) begin
            Out<=0;
        end else begin
            Out<=Sum;
        end
    end

	 assign {uio_out,uo_out}= Out;
	 
wire _unused = &{ena, 1'b0};
   
endmodule
