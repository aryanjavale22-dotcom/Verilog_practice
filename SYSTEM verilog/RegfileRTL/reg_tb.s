module testbench;
logic clk;

    logic write_en;
    logic [2:0] write_addr;
    logic [7:0] write_data;

    logic [2:0] read_addr1;
    logic [2:0] read_addr2;

    logic [7:0] read_data1;
    logic [7:0] read_data2;
 regfile dut(
        .clk(clk),

        .write_en(write_en),
       
        .write_data(write_data),

       
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
always #5 clk = ~clk;

    initial begin

        $dumpfile("regfile.vcd");
        $dumpvars(0, testbench);

        $monitor("time=%0t | WE=%b | WADDR=%d | WDATA=%h | RADDR1=%d | RDATA1=%h | RADDR2=%d | RDATA2=%h",
                 $time,
                 write_en,
                 write_addr,
                 write_data,
                 read_addr1,
                 read_data1,
                 read_addr2,
                 read_data2);
                  // Initial values
        clk = 0;
        write_en = 0;
        write_addr = 0;
        write_data = 0;
        read_addr1 = 0;
        read_addr2 = 0;

        #10;
    

      // Write AA into R1
        write_en = 1;
        write_addr = 3'd1;
        write_data = 8'hAA;

        #10;

        // Write 55 into R2
        write_addr = 3'd2;
        write_data = 8'h55;

        #10;

        // Stop writing
        write_en = 0;

        // Read R1 and R2 simultaneously
        read_addr1 = 3'd1;
        read_addr2 = 3'd2;

        #10;

        // Read R2 and R1 simultaneously
        read_addr1 = 3'd2;
        read_addr2 = 3'd1;

        #10;

        $finish;

    end

endmodule
