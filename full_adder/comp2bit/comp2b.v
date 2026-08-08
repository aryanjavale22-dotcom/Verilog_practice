module comp2b(a,b,y);
 input [1:0]a,b;
 output reg [2:0]y;

 always@(*)
     begin
        if(a>b)
        y=3'b100;
        else if(a==b)
        y=3'b010;
        else 
        y=3'b001;
     end
endmodule
