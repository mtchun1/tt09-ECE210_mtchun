module full_adder (
    input wire A,
    input wire B,
    input wire C_in,
    input wire clk,
    input wire reset_n,
    output wire sum,
    output wire C_out
);
    wire nand1_out, nand2_out, nand3_out, nand4_out;
    wire nand5_out, nand6_out, nand7_out, nand8_out;
    wire xor_ab, and_ab_cin;

    perceptron nand1 (.v_in1({3'b000, A}), .v_in2({3'b000, B}), .clk(clk), .reset_n(reset_n), .v_out(nand1_out));
    perceptron nand2 (.v_in1({3'b000, A}), .v_in2({3'b000, nand1_out}), .clk(clk), .reset_n(reset_n), .v_out(nand2_out));
    perceptron nand3 (.v_in1({3'b000, B}), .v_in2({3'b000, nand1_out}), .clk(clk), .reset_n(reset_n), .v_out(nand3_out));
    perceptron nand4 (.v_in1({3'b000, nand2_out}), .v_in2({3'b000, nand3_out}), .clk(clk), .reset_n(reset_n), .v_out(xor_ab));

    perceptron nand5 (.v_in1({3'b000, xor_ab}), .v_in2({3'b000, C_in}), .clk(clk), .reset_n(reset_n), .v_out(nand5_out));
    perceptron nand6 (.v_in1({3'b000, xor_ab}), .v_in2({3'b000, nand5_out}), .clk(clk), .reset_n(reset_n), .v_out(nand6_out));
    perceptron nand7 (.v_in1({3'b000, C_in}), .v_in2({3'b000, nand5_out}), .clk(clk), .reset_n(reset_n), .v_out(nand7_out));
    perceptron nand8 (.v_in1({3'b000, nand6_out}), .v_in2({3'b000, nand7_out}), .clk(clk), .reset_n(reset_n), .v_out(sum));

    // C_out calculation
    perceptron nand9 (.v_in1({3'b000, A & B}), .v_in2({3'b000, C_in & xor_ab}), .clk(clk), .reset_n(reset_n), .v_out(C_out));

endmodule
