`timescale 1ns/1ps

module alu_tb;

    logic [7:0] a;
    logic [7:0] b;
    logic [2:0] sel;
    logic [7:0] y;

    alu #(.WIDTH(8)) dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $monitor("time=%0t | a=%d | b=%d | sel=%b | y=%d",
                 $time, a, b, sel, y);

        // ADD
        a = 8'd10;
        b = 8'd5;
        sel = 3'b000;
        #10;

        // SUB
        sel = 3'b001;
        #10;

        // AND
        sel = 3'b010;
        #10;

        // OR
        sel = 3'b011;
        #10;

        // XOR
        sel = 3'b100;
        #10;

        // SLT
        a = 8'd5;
        b = 8'd10;
        sel = 3'b101;
        #10;

        // Another ADD
        a = 8'd100;
        b = 8'd50;
        sel = 3'b000;
        #10;

        $finish;

    end

endmodule