module testbench;
reg [2:0]a;
wire [7:0]y;
decoder_3to8 uut(.a(a),.y(y));
initial 
      begin
        $dumpfile("decoder.vcd");
        $dumpvars(0,testbench);

        $monitor($time," a=%b y=%b", a, y);
        #5 a=3'b001;
        #5 a=3'b000;
        #5 a=3'b011;
        #5 a=3'b111;
        #5 $finish;
      end
endmodule
