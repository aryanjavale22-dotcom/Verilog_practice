module cla4bit(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,

    output [3:0] sum,
    output       cout
);

wire [3:0] G, P;
wire c1, c2, c3;

// Generate and Propagate
assign G = a & b;
assign P = a ^ b;

// Carry Equations
assign c1 = G[0] | (P[0] & cin);

assign c2 = G[1] |
            (P[1] & G[0]) |
            (P[1] & P[0] & cin);

assign c3 = G[2] |
            (P[2] & G[1]) |
            (P[2] & P[1] & G[0]) |
            (P[2] & P[1] & P[0] & cin);

assign cout = G[3] |
              (P[3] & G[2]) |
              (P[3] & P[2] & G[1]) |
              (P[3] & P[2] & P[1] & G[0]) |
              (P[3] & P[2] & P[1] & P[0] & cin);

// Sum Equations
assign sum[0] = P[0] ^ cin;
assign sum[1] = P[1] ^ c1;
assign sum[2] = P[2] ^ c2;
assign sum[3] = P[3] ^ c3;

endmodule