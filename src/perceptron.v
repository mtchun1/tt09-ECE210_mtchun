`default_nettype none

module perceptron (
    input wire          v_in1,
    input wire          v_in2,
    input wire signed [2:0]    w1_in,
    input wire signed [2:0]    w2_in,
    input wire          clk,
    input wire          reset_n,
    output reg signed [3:0]   state,
    output wire         v_out
);

    wire signed [3:0] next_state;
    reg signed [3:0] threshold;
    reg signed [2:0] w1;
    reg signed [2:0] w2;

    always @(posedge clk) begin

        if (!reset_n) begin
            state <= 0;
            threshold <= 3;
        end else begin
            w1 <= w1_in;
            w2 <= w2_in;
            state <= next_state;
        end
    end

    // next state logic
    assign next_state = (w1 * v_in1) + (w2 * v_in2) + threshold;

    assign v_out = (state > 0) ? 1'b1 : 1'b0;

endmodule