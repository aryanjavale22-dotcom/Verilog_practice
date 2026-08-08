module fulladd(a,b,cin,s,cout);
input a,b,cin;  
output reg s,cout;
always @(a or b or cin)
begin
    s = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (a & cin);
end
endmodule