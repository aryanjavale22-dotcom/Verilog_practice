
module testbench;

reg [3:0] a, b;
reg cin;

wire [3:0] sum;
wire cout;

cla4bit dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial
begin

    $dumpfile("cla4bit.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t A=%h B=%h Cin=%b Sum=%h Cout=%b",
             $time, a, b, cin, sum, cout);

    // Test 1
    #5;
    a = 4'b0011;
    b = 4'b1101;
    cin = 0;

    // Test 2
    #5;
    a = 4'b1100;
    b = 4'b0110;
    cin = 1;

    // Test 3
    #5;
    a = 4'b1111;
    b = 4'b1010;
    cin = 1;

    // Test 4
    #5;
    a = 4'b0101;
    b = 4'b0011;
    cin = 0;

    // Test 5
    #5;
    a = 4'b1111;
    b = 4'b1111;
    cin = 0;

    #10;
    $finish;

end

endmodule