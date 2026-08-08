module testbench;
reg [0:3]a;reg [0:1]s; wire y;

mux_4to1 uut(.a(a),.s(s),.y(y));
initial 
      begin
           $dumpfile("mux4to1.vcd");
           $dumpvars(0, testbench);

        $monitor($time," a[0]=%b,a[1]=%b,a[2]=%b,a[3]=%b,s[0]=%b,s[1]=%b",a[0],a[1],a[2],a[3],s[0],s[1],y);

        #5 a=4'b1001; s=2'b01;
        #5 a=4'b1101; s=2'b00;
        #5 a=4'b1011; s=2'b11;
        #5 a=4'b1000; s=2'b10;
        #5 a=4'b1111; s=2'b11;

        #5 $finish;
      end
endmodule   

