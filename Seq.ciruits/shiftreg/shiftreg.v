module shiftreg(clk,clear,d,in);
input clk,clear,in;
output reg d;
reg a,b,c;

always@(posedge clk )
     begin
        if(!clear) begin
        a<=0;
        b<=0;
        c<=0;
        d<=0;
        end
       
     
        else begin
        d<=c;
        c<=b;
        b<=a;
        a<=in;
        end
     end
endmodule

