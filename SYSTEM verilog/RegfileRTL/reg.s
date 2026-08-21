module regfile #(
    parameter width = 8,
    parameter depth = 8
)(
    input logic clk,
    input logic write_en,

    input logic [$clog2(depth)-1:0] write_add,
    input logic [$clog2(depth)-1:0] read_add1,
    input logic [$clog2(depth)-1:0] read_add2,

    input logic [width-1:0] write_data,

    output logic [width-1:0] read_data1,
    output logic [width-1:0] read_data2
);

    logic [width-1:0] registers [0:depth-1];

    // Write
    always_ff @(posedge clk) begin
        if (write_en)
            registers[write_add] <= write_data;
    end

    // Read
    always_comb begin
        read_data1 = registers[read_add1];
        read_data2 = registers[read_add2];
    end

endmodule