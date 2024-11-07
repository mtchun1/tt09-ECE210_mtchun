`default_nettype none

module lif (
    input wire [0:7]    current,
    input wire          clk,
    input wire          reset_n,
    output reg  [0:7]    state,
    output wire         spike
);
    wire [0:7] next_state;
    reg [0:7] threshold;

    always @(posedge clk) begin

        if (!reset_n) begin
            state <= 0;
            threshold <= 200;
        end else begin
            state <= next_state;
        end
    end

    // next state logic
    assign next_state = current + (state << 1);

    // spiking logic
    assign spike = (state >= threshold);
endmodule