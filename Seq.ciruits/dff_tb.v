module testbench;
reg d,clk;
wire q;

dff dut(.d(d),.clk(clk),.q(q));

initial 
     begin 
        $dumpfile("dff.vcd");
        $dumpvars(0,testbench);

        $monitor($time," d=%b,q=%b,clk=%b",d,q,clk);
        
        clk =0;
        d=0;

        #10 d=1;
        #10 d=0;
        #10 d=1;
        #5 $finish ;
     end
     always #5 clk = ~clk;
endmodule


