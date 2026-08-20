module testbench;
reg clk;
reg[3:0]read_add1,read_add2;
reg [3:0]write_add;
reg write_enable;
reg [31:0]write_data;
wire [31:0]read_data1,read_data2;

ram dut(.clk(clk),.read_add1(read_add1),.read_add2(read_add2),.write_add(write_add),.write_enable(write_enable),.write_data(write_data)
,.read_data1(read_data1),.read_data2(read_data2));

initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0,testbench);
   
   clk=0;
   write_enable=0;
   read_add1=0;
   read_add2=0;
   write_add=0;
   write_data=0;
   #10 write_enable=1;
    write_add =1;
    write_data= 3'b100;
    #10 write_add =3;
    write_data=3'b010;

    #10 write_enable=0;
    #10 read_add1=2'b01;
    read_add2=2'b11;
    #10 $finish;
end
always #5 clk=~clk;
endmodule

