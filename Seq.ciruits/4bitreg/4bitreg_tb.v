module testbench;
reg [3:0]d;
reg clk;
wire [3:0]q;

reg4bit dut(.d(d),.clk(clk),.q(q));

initial 
     begin 
        $dumpfile("reg4bit.vcd");
        $dumpvars(0,testbench);

        $monitor($time," d=%b,q=%b,clk=%b",d,q,clk);
        
        clk =0;
        d=4'b0000;

        #10 d=4'b0011;
        #10 d=4'b0101;
        #10 d=4'b1101;
        #10 d=4'b0110;
        #5 $finish ;
     end
     always #5 clk = ~clk;
endmodule