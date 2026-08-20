module testbench;
reg clk;
reg[1:0]read_add1,read_add2;
reg [1:0]write_add;
reg write_enable;
reg [7:0]write_data;
wire [7:0]read_data1,read_data2;

reg8bit dut(.clk(clk),.read_add1(read_add1),.read_add2(read_add2),.write_add(write_add),.write_enable(write_enable),.write_data(write_data)
,.read_data1(read_data1),.read_data2(read_data2));

initial begin
    $dumpfile("reg8bit.vcd");
    $dumpvars(0,testbench);
   
   clk=0;
   write_enable=0;
   read_add1=0;
   read_add2=0;
   write_add=0;
   write_data=0;
   #10 write_enable=1;
    write_add =1;
    write_data= 8'b00011001;
    #10 write_add =3;
    write_data=8'b00110100;

    #10 write_enable=0;
    #10 read_add1=2'b01;
    read_add2=2'b11;
    #10 $finish;
end
always #5 clk=~clk;
endmodule


