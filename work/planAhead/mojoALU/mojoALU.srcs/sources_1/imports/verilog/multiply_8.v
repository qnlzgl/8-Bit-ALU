/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiply_8 (
    input [7:0] a,
    input [7:0] b,
    input [1:0] alufn,
    output reg [7:0] out
  );
  
  
  
  always @* begin
    out = 1'h0;
    if (alufn == 2'h3) begin
      out = a * b;
    end else begin
      if (alufn == 2'h2) begin
        if (b == 1'h0) begin
          out = 8'hff;
        end else begin
          out = a / b;
        end
      end
    end
  end
endmodule