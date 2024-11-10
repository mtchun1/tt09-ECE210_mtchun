`default_nettype none

module tt_um_perceptron_8bfulladder_mtchun (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs 
    input  wire [7:0] uio_in,   // IOs: Input path (used for B)
    output wire [7:0] uio_out,  // IOs: Output path, not used here
    output wire [7:0] uio_oe,   // IOs: Enable path (0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, ignore if unused
    input  wire       clk,      // clock, not used in this combinational design
    input  wire       rst_n     // reset_n, low to reset, not used here
);

  // Disable IO output enables
  assign uio_oe = 8'b0;

  // Define input signals A and B as wires, as this is a combinational design
  wire [7:0] A = ui_in;       // Connect ui_in to A
  wire [7:0] B = uio_in;      // Connect uio_in to B

  // Carry signals between full adders
  wire [7:0] carry;

  // Output wire for sum result
  wire [7:0] out;

  // Directly assign out to uo_out
  assign uo_out = out;

  // Instantiate full adders for each bit of A and B
  full_adder fa0 (.A(A[0]), .B(B[0]), .C_in(1'b0),     .clk(clk), .reset_n(rst_n), .sum(out[0]), .C_out(carry[0]));
  full_adder fa1 (.A(A[1]), .B(B[1]), .C_in(carry[0]), .clk(clk), .reset_n(rst_n), .sum(out[1]), .C_out(carry[1]));
  full_adder fa2 (.A(A[2]), .B(B[2]), .C_in(carry[1]), .clk(clk), .reset_n(rst_n), .sum(out[2]), .C_out(carry[2]));
  full_adder fa3 (.A(A[3]), .B(B[3]), .C_in(carry[2]), .clk(clk), .reset_n(rst_n), .sum(out[3]), .C_out(carry[3]));
  full_adder fa4 (.A(A[4]), .B(B[4]), .C_in(carry[3]), .clk(clk), .reset_n(rst_n), .sum(out[4]), .C_out(carry[4]));
  full_adder fa5 (.A(A[5]), .B(B[5]), .C_in(carry[4]), .clk(clk), .reset_n(rst_n), .sum(out[5]), .C_out(carry[5]));
  full_adder fa6 (.A(A[6]), .B(B[6]), .C_in(carry[5]), .clk(clk), .reset_n(rst_n), .sum(out[6]), .C_out(carry[6]));
  full_adder fa7 (.A(A[7]), .B(B[7]), .C_in(carry[6]), .clk(clk), .reset_n(rst_n), .sum(out[7]), .C_out(carry[7])); // Final carry out

endmodule
