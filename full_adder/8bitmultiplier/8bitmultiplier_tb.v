module testbench;
reg [3:0]a,b;
wire [7:0]p;

multipler8bit dut(.a(a),.b(b),.p(p));
initial
     begin 
        $dumpfile("8bitmul.vcd");
        $dumpvars(0,testbench);

        $monitor($time,"a=%b,b=%b,p=%b",a,b,p);

        #10 a=4'b0101; b=4'b1101;
        #10 a=4'b1100; b=4'b0101;
        #10 a=4'b0000;b=4'b1010;
        #5 $finish;
        end
endmodule

