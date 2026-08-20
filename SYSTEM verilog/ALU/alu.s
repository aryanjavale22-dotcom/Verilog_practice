module alu#( parameter WIDTH=8)(
    input logic [WIDTH-1:0]a,b,
    input logic [2:0]sel,
    output logic [WIDTH-1:0] y
);

always_comb begin
    case(sel) 
    3'b000: y = a+b;
    3'b001:  y= a-b;
    3'b010: y= a&b;
    3'b011: y= a|b;
    3'b100: y= a^b;
   3'b101: y = {{(WIDTH-1){1'b0}}, (a < b)};
    default: y= '0;
    endcase
end
endmodule