`timescale 1ns/1ps

module mux16_to_1_tb;

reg [15:0] in;
reg [3:0] sel;
wire out;

mux16_to_1 uut (
    .in(in),
    .sel(sel),
    .out(out)
);

initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux16_to_1_tb);

    in = 16'b1010101010101010;

    sel = 4'd0;  #10;
    sel = 4'd1;  #10;
    sel = 4'd2;  #10;
    sel = 4'd3;  #10;
    sel = 4'd4;  #10;
    sel = 4'd5;  #10;
    sel = 4'd6;  #10;
    sel = 4'd7;  #10;
    sel = 4'd8;  #10;
    sel = 4'd9;  #10;
    sel = 4'd10; #10;
    sel = 4'd11; #10;
    sel = 4'd12; #10;
    sel = 4'd13; #10;
    sel = 4'd14; #10;
    sel = 4'd15; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t sel=%d out=%b", $time, sel, out);
end

endmodule