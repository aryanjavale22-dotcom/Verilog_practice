module bcd_7seg(input [3:0]a, output  [6:0]b);

assign b[0]= a[1]|a[3]|a[0]&a[2];
assign b[1]= (~a[2])|(~a[1])&(~a[0])|a[1]&a[0];
assign b[2]= ~a[1] | a[0] |a[2];
assign b[3] = a[3] |a[1]&(~a[0]) |a[1]&(~a[2]);
assign b[4] = a[1]&(~a[0]) | (~a[0])&(~a[2]);
assign b[5] = a[3] |(~a[0])&a[2] | (~a[0])&(~a[1]) |(~a[1])&(~a[2]);
assign b[6] = a[3] | (~a[1])&a[2] | a[1]&(~a[0]) | a[1]&(~a[2]);
endmodule