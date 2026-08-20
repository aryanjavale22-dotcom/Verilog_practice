module testbench;
reg clk, clear;
wire [3:0]q;

upsynco dut(.clk(clk),.clear(clear),.q(q));

initial begin
    $dumpfile("upsynco.vcd");
    $dumpvars(0,testbench);

    $monitor($time,"clk=%b,clear=%b,q=%b",clk,clear,q);
    clk=0;
    clear=1;

    #10 clear=0;

    #100 $finish;
end
always #5 clk =~clk;
endmodule
