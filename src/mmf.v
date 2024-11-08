`default_nettype none

module mmf (
    input wire [7:0]    x_input,
    input wire          clk,
    input wire          reset_n,
    output reg [7:0]    state
);
    wire [7:0] next_state;
    reg [15:0] w;

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
    assign next_state = w * x_input;

endmodule