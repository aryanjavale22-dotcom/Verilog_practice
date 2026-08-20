module testbench;
reg clk ,clear;
wire [2:0]q;

asyn3bit dut(.clk(clk),.clear(clear),.q(q));

initial begin
    $dumpfile("asyn3bit.vcd");
    $dumpvars(0,testbench);
    $monitor($time," clk =%b,clear=%b,q=%b",clk,clear,q);

    clear =1;
   clk =0;

    #10 clear =0;
    #100 $finish;
end
always #5 clk =~clk;
endmodule
