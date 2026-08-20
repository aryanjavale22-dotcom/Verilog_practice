module multipler8bit(a,b,p);
    input [3:0]a,b;
     output [7:0]p;
     wire [7:0]p1,p2,p3;
     assign p1= b[0]?{4'b0000,a}:8'b0;
     assign p2 =b[1]?{3'b000,a,1'b0}:8'b0;
     assign p3 =b[2]?{2'b00,a,2'b00}:8'b0;
     
     assign p = p1+p2 +p3;
endmodule
