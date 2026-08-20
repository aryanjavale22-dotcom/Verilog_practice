module alu2bit( input [1:0]a,b, input [1:0]sel , output reg [1:0]y ,output reg carry);

 always@ (*)
    begin
        carry =0;
 case(sel)
    
        2'b00 : {carry,y} =a+b;
        2'b01 : {carry,y} = a-b;
        2'b10 : y= a&b;
        2'b11 : y=a|b;
        default : 
            y = 2'b00;
         
    
 endcase
    end

    
endmodule        


