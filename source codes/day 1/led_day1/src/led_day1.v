module led_blink (
    input  wire clk,
    output reg  led
);

reg [27:0] counter;

always @(posedge clk) begin
    if (counter == 28'd134_999_999) begin
        counter <= 28'd0;
        led <= ~led;
    end
    else begin
        counter <= counter + 1'b1;
    end
end

endmodule