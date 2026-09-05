module pwm(
    input wire clk,
    input wire rst,
    output reg led
);

reg [7:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 8'd0;
        led <= 1'b0;
    end
    else begin
        counter <= counter + 1'b1;

        if (counter < 8'd128)
            led <= 1'b1;
        else
            led <= 1'b0;
    end
end

endmodule