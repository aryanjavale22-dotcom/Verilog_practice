module sipo(
    input in,clk,clear,
    output reg [3:0]q
);

always @(posedge clk)
      begin
        if(clear) begin
            q<= 4'b0000;
        end
        else begin
             q<= {q[2:0],in};
        end
      end
endmodule