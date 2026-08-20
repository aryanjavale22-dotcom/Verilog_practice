module alu4bit(a,b,sel,carry,y,zero);
input [3:0]a,b;
input [2:0]sel;
output reg [3:0]y;
output reg carry,zero;

always@(*)
     begin
        case(sel)

          3'b000: begin
            y=a>>1;
            carry=0;
        end
        
        3'b001: begin
            y=a|b;
            carry=0;
        end
          3'b010: begin
            y=a&b;
        end
          3'b011: begin
            {carry,y}=a+b;
        end
          3'b100: begin
            {carry,y}=a-b;
        end
          3'b101: begin
            y=a^b;
            carry=0;
        end
          3'b110: begin
            y= ~b;
            carry=0;
        end
          3'b111: begin
            y=a<<1;
            carry=0;
        end
         default : begin
           y= 4'b0000;
           carry=0;
         end
        endcase 
     end
endmodule
