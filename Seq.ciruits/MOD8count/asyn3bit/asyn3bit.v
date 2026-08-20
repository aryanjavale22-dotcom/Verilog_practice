module asyn3bit(
    input clk,clear,
    output reg [2:0]q 
);

always@( posedge clk or posedge clear)
      begin
        if(clear)
        begin
            q[0] <= 1'b0;
        end
        else begin
            q[0]<= ~q[0];
        end
      end
        
always@( negedge q[0] or posedge clear)
        begin 
            if (clear)
            begin
                q[1] <= 1'b0;
            end
            else begin
                q[1] <= ~q[1];
            end
        end
always@( negedge q[1] or posedge clear)
begin
    if(clear) begin
        q[2]<=1'b0;
    end
    else begin
    q[2]<= ~q[2];
    end
end
endmodule

