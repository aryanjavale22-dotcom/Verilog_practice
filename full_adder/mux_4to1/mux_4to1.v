module mux_4to1(a,s,y);
input [0:3]a;
input [0:1]s;
output reg y;
 
always@(*)
begin
 y = (~s[1] & ~s[0] & a[0]) |
    (~s[1] &  s[0] & a[1]) |
    ( s[1] & ~s[0] & a[2]) |
    ( s[1] &  s[0] & a[3]);
end
endmodule