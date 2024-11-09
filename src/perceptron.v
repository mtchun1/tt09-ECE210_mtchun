`default_nettype none

module perceptron (
    input wire [3:0]    v_in1,
    input wire [3:0]    v_in2,
    input wire          clk,
    input wire          reset_n,
    output reg signed [7:0]   state,
    output wire         v_out
);

    wire signed [7:0] next_state;
    reg signed [7:0] threshold;
    reg signed [3:0] w1;
    reg signed [3:0] w2;

    always @(posedge clk) begin

        if (!reset_n) begin
            state <= 0;
            threshold <= 3;
            w1 <= -2;
            w2 <= -2;
        end else begin
            state <= next_state;
        end
    end

    // next state logic
    assign next_state = w1 * $signed(v_in1) + w2 * $signed(v_in2) + threshold;

    assign v_out = (state > 0) ? 1'b1 : 1'b0;

endmodule