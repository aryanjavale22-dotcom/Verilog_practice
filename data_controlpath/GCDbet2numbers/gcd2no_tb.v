module testbench;
    reg clk,clear,start;
    wire out;



seq_det dut(.clk(clk),.clear(clear),.in(in),.out(out));

initial begin
    $dumpfile("seqdet.vcd");
    $dumpvars(0,testbench);

    $monitor($time,"clk=%b,clear=%b,.in(in),.out(out)",
    clk,clear,in,out);
    clk=0;
    clear=1;
    in=0;
    #10 clear =0;
    #10 in=1;
    #10 in=0;
    #10 in=1;

    #100 $finish;
end
always #5 clk =~clk;
endmodule

