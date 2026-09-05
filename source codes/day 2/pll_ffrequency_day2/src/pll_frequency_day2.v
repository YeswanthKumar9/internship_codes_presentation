module pll_frequency_day2 (
    input  wire sys_clk,
    output wire led
);

wire pll_clk;

// 27 MHz input → approximately 50 MHz PLL output
Gowin_PLLVR u_pll (
    .clkin  (sys_clk),
    .clkout (pll_clk)
);

// 5-second ON/OFF timer at approximately 50 MHz
reg [27:0] counter = 28'd0;
reg led_reg = 1'b0;

always @(posedge pll_clk) begin
    if (counter == 28'd249999999) begin
        counter <= 28'd0;
        led_reg <= ~led_reg;
    end
    else begin
        counter <= counter + 1'b1;
    end
end

assign led = led_reg;

endmodule