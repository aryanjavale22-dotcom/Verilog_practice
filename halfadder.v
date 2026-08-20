module halfadder(a,b,sum,carry);
input a,b;
output sum,carry;
XOR or1(sum,a,b);
AND and1(carry,a,b);
endmodule