module alu#( parameter WIDTH=8)(
    input logic [WIDTH-1:0]a,b,
    input logic [2:0]sel,
    output logic [WIDTH-1:0] y,
    output logic carry,zero
);
logic [8:0]temp;
always_comb begin
    case(sel) 
    3'b000: begin temp = a+b;
            y = temp[8:0];
            carry = temp[8];
            end
    
    3'b001:  y= a-b;
    3'b010: y= a&b;
    3'b011: y= a|b;
    3'b100: y= a^b;
   3'b101: y = {{(WIDTH-1){1'b0}}, (a < b)};
    default: y= '0;
    endcase
    if(y==0) begin
    zero = 1'b1;
    end
    else begin
    zero=1'b0;
    end
   
end
endmodule