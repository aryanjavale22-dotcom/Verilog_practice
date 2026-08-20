module alu(
    input [31:0] reg_a,reg_b,
input [31:0] immediate, 
input select , output  [31:0] result

);
wire [31:0]alu_b;
assign alu_b = select?immediate:reg_b;
assign result = reg_a + alu_b;
endmodule
