module reg8bit(
    input [1:0]read_add1,
    input [1:0]read_add2,
    input [1:0]write_add,
   
    input[7:0]write_data,
    input clk,
    input write_enable,
    output [7:0]read_data1,
    output  [7:0]read_data2
);
reg [7:0]registers [0:3];

assign read_data1 =registers[read_add1];
assign read_data2 =registers[read_add2];
always@(posedge clk) begin
    if(write_enable) begin
        registers[write_add]<=write_data;
    end
   
end
endmodule



