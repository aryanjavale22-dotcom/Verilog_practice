module  alu2bit_tb;
reg [1:0]a,b;
reg [1:0]sel;
wire [1:0]y;
wire carry;

alu2bit dut(.a(a),.b(b),.sel(sel),.y(y),.carry(carry));

initial 
    begin 
        $dumpfile("alu2bit.vcd");
        $dumpvars(0,alu2bit_tb);
        $monitor($time," a=%b,b=%b,sel=%b,y=%b,carry=%b",a,b,sel,y,carry);

    #5 a=2'b01; b=2'b00; sel =2'b11;
    #5 a=2'b11; b=2'b01; sel =2'b01;
    #5 a=2'b00; b=2'b10; sel =2'b10;
    #5 a=2'b10; b=2'b11; sel =2'b00;
    #5 a=2'b01; b=2'b00; sel =2'b10;
    #20 $finish;
    end
endmodule

