module testbench;
reg [1:0]a,b;
wire [2:0]y;
 
comp2b uut(.a(a),.b(b),.y(y));
initial 
    begin
        $dumpfile("comp2bit.vcd");
        $dumpvars(0,testbench);
        $monitor($time,"a=%b,b=%b,y=%b",a,b,y);

        #5 a=2'b01; b=2'b10;
        #5 a=2'b11; b=2'b10;
        #5 a=2'b00; b=2'b10;
        #5 $finish;
    end
endmodule