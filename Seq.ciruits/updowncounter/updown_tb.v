module testbench;
reg clk, clear,up_down;
wire [3:0]q;

updown dut(.clk(clk),.clear(clear),.q(q),.up_down(up_down));

initial begin
    $dumpfile("updown.vcd");
    $dumpvars(0,testbench);

    $monitor($time,"clk=%b,clear=%b,q=%b,up_down=%b",clk,clear,q,up_down);
    clk=0;
    clear=1;
    up_down =1;

    #10 clear=0;
     #50 up_down =0;
    #100 $finish;
end
always #5 clk =~clk;
endmodule
