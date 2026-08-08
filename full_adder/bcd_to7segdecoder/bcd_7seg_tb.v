module testbench ;
reg [3:0]a;
wire [6:0]b;
integer i;

bcd_7seg dut(.a(a),.b(b));
initial 
     begin
        $dumpfile("bcd_7seg.vcd");
        $dumpvars(0,testbench);
        $monitor($time,"a=%b ,b=%b",a,b);
         for(i=0 ; i<16 ;i =i+1) begin
         a=i;
         #5;
         end

        #20 $finish ;
     end
endmodule
