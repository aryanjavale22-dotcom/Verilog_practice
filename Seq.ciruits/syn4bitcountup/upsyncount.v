module upsynco( 
    input clk , clear,
    output reg [3:0]q
);
always@( posedge clk or posedge clear) begin
    if(clear) begin
        q <= 4'b0000;
    end
    else begin
        q <= q + 1'b1;
    end
end
endmodule
 