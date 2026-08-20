module testbench;
 reg [7:0]a,b;
 
  reg din;
 wire [7:0]sum;
 wire dout;

 carryaddr8bit dut(.a(a),.b(b),.din(din),.sum(sum),.dout(dout));

 initial
       begin
        $dumpfile("carryaddr8bit.vcd");
        $dumpvars(0,testbench);
         
        $monitor($time," a=%b,b=%b,din=%b,sum=%b,dout=%b",a,b,din,sum,dout);

        #5 a=8'b01010101 ; b = 8'b10101010; din=1'b0;
        #5 a=8'b11110000; b= 8'b00110011; din=1'b1;
          #5 a=8'b01010101 ; b = 8'b10101010; din=1'b0;
        #5 a=8'b11110101; b= 8'b00110010; din=1'b1;
          #5 a=8'b01010111 ; b = 8'b00100010; din=1'b1;
        #5 a=8'b11110110; b= 8'b10111011; din=1'b0;
        #10 $finish;
       end
endmodule




