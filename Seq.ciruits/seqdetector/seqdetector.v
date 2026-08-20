module seq_det(
    input in,clk,clear,
    output reg out
);
reg [1:0] state ,next_state;
parameter s0 = 2'b00 , 
 s1 = 2'b01 , s2 = 2'b10;

always@(posedge clk or posedge clear)
begin
    if(clear) begin
        state <= s0;
    end
    else begin 
        state <= next_state;
    end
end
;
always@(*)
begin
    case(state)
    s0:
    if(in) begin
        next_state = s1;
    end
    else begin
        next_state= s0;
    end
    s1:
    if(in) begin
        next_state = s1;
    end
    else begin
        next_state= s2;
    end
    s2:
    if(in) begin
        next_state=s1;
        out =1'b1;
    end
    else begin
        next_state= s0;
        out =1'b0;
    end
    default begin
        next_state =1'b0;
        out= 1'b0;
    end
    endcase
end
endmodule





