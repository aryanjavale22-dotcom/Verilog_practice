module testbench;
reg clk,clear,in;
wire d;
shiftreg dut(.d(d),.clk(clk),.clear(clear),.in(in));

initial
  begin
    clk =0;
    #5 clear =0;
    #5 in=0;
  end
  always #5 clk =~clk;
  initial begin
    #5 clear=1;
    #10 in=0;
    #10 in=1;
    #10 in=0;
    #10 in=1;
    #10 $finish;
 
  end
initial begin
    $dumpfile("shiftreg.vcd");
    $dumpvars(0,testbench);
    $monitor($time,"d=%b,clk=%b,clear=%b,in=%b",d,clk,clear,in);
end
endmodule
