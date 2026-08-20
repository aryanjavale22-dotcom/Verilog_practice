module testbench ;
reg in, clk,clear;
wire [3:0]q;

sipo dut(.in(in),.clk(clk),.clear(clear),.q(q));

initial 
    begin
        $dumpfile("sipo.vcd");
        $dumpvars(0,testbench);

        $monitor ($time," in=%b,clk=%b,clear=%b,q=%b",in,clk,clear,q);
        clk =0;
        clear =1;
        in =0;

        #10 clear =0;

        #10 in=1;
        #10 in=0 ;
        #10 in =1;
        #10 $finish;
    end
    always #5 clk =~clk;
endmodule

