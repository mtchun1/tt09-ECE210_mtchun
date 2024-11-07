`default_nettype none

module mmf (
    input wire [0:7]    current,
    input wire          clk,
    input wire          reset_n,
    output reg [0:7]    state
);
    wire [0:7] next_state;
    reg [0:7] w;

    always @(posedge clk) begin

        if (!reset_n) begin
            state <= 0;
            w <= -1;
            // w <= 8'b11111111;
        end else begin
            state <= next_state;
        end
    end

    // next state logic
    assign next_state = w * current;

endmodule