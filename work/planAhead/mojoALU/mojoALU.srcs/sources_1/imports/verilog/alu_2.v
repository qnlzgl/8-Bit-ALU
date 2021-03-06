/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_2 (
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    input [5:0] alufn,
    output reg [7:0] out,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  wire [8-1:0] M_aluadder_out;
  wire [1-1:0] M_aluadder_z;
  wire [1-1:0] M_aluadder_v;
  wire [1-1:0] M_aluadder_n;
  adder_4 aluadder (
    .a(a),
    .b(b),
    .alufn(alufn[0+0-:1]),
    .out(M_aluadder_out),
    .z(M_aluadder_z),
    .v(M_aluadder_v),
    .n(M_aluadder_n)
  );
  wire [8-1:0] M_alucomparator_op;
  comparator_5 alucomparator (
    .a(a),
    .b(b),
    .alufn(alufn[1+1-:2]),
    .op(M_alucomparator_op)
  );
  wire [8-1:0] M_aluboolean_out;
  boolean_6 aluboolean (
    .a(a),
    .b(b),
    .alufn(alufn[0+3-:4]),
    .out(M_aluboolean_out)
  );
  wire [8-1:0] M_alushifter_out;
  shifter_7 alushifter (
    .a(a),
    .b(b),
    .alufn(alufn[0+1-:2]),
    .out(M_alushifter_out)
  );
  wire [8-1:0] M_alumultiply_out;
  multiply_8 alumultiply (
    .a(a),
    .b(b),
    .alufn(alufn[0+1-:2]),
    .out(M_alumultiply_out)
  );
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_9 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  always @* begin
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    out = 1'h0;
    
    case (alufn[4+1-:2])
      2'h0: begin
        if (alufn[1+0-:1] == 1'h1) begin
          out = M_alumultiply_out;
        end else begin
          out = M_aluadder_out;
        end
      end
      2'h3: begin
        out = M_alucomparator_op;
      end
      2'h1: begin
        out = M_aluboolean_out;
      end
      2'h2: begin
        out = M_alushifter_out;
      end
      default: begin
        out = 1'h0;
      end
    endcase
    
    case (alufn[0+5-:6])
      6'h00: begin
        M_seg_values = 16'h011f;
      end
      6'h01: begin
        M_seg_values = 16'h895f;
      end
      6'h03: begin
        M_seg_values = 16'h3396;
      end
      6'h02: begin
        M_seg_values = 16'h1d9f;
      end
      6'h18: begin
        M_seg_values = 16'h0a7f;
      end
      6'h1e: begin
        M_seg_values = 16'h70ff;
      end
      6'h16: begin
        M_seg_values = 16'hc70f;
      end
      6'h17: begin
        M_seg_values = 16'ha0a1;
      end
      6'h11: begin
        M_seg_values = 16'ha70f;
      end
      6'h19: begin
        M_seg_values = 16'hca70;
      end
      6'h1a: begin
        M_seg_values = 16'h0fff;
      end
      6'h1c: begin
        M_seg_values = 16'h5fff;
      end
      6'h20: begin
        M_seg_values = 16'h8b6f;
      end
      6'h21: begin
        M_seg_values = 16'h8b0f;
      end
      6'h23: begin
        M_seg_values = 16'h800f;
      end
      6'h33: begin
        M_seg_values = 16'h2334;
      end
      6'h35: begin
        M_seg_values = 16'h2334;
      end
      6'h37: begin
        M_seg_values = 16'h2334;
      end
      default: begin
        M_seg_values = 16'hffff;
      end
    endcase
  end
endmodule
