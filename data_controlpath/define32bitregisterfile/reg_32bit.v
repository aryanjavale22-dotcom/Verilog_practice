module reg32bit(
    input [4:0]read_add1,
    input [4:0]read_add2,
    input [4:0]write_add,
   
    input[31:0]write_data,
    input clk,
    input write_enable,
    output [31:0]read_data1,
    output  [31:0]read_data2
);
reg [31:0]registers [0:31];

assign read_data1 =registers[read_add1];
assign read_data2 =registers[read_add2];
always@(posedge clk) begin
    if(write_enable) begin
        registers[write_add]<=write_data;
    end
   
end
endmodule
