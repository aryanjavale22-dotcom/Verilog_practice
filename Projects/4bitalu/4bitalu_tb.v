module testbench;
reg [3:0]a,b;
reg [2:0]sel;
wire [3:0]y;
wire carry,zero;

alu4bit dut(.a(a),.b(b),.sel(sel),.carry(carry),.y(y),.zero(zero));

initial
  begin
    $dumpfile("alu4bit.vcd");
    $dumpvars(0,testbench);

    $monitor($time,"a=%b,b=%b,sel=%b,carry=%b,y=%b,zero=%b",a,b,sel,carry,y,zero);
    #5 a=4'b0011; b=4'b1100;
    #5 sel=3'b000;
    #5 sel=3'b001;
    #5 sel=3'b010;
    #5 sel=3'b011;
    #5 sel=3'b100;
    #5 sel=3'b101;
    #5 sel=3'b110;
    #5 sel=3'b111;
    #10 $finish;
  end
endmodule


