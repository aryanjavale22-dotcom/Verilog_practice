module seq_det2(
    input clk,clear,in,
    output reg out
);
reg [3:0] state ,next_state;
parameter s0= 4'b0000 ,s1=4'b0001 ,s2 =4'b0010,s3 =4'b0011;
always@(posedge clk or posedge clear) begin
    if(clear) begin
        state<= 1'b0;
    end
    else begin
        state<= next_state;
    end
end
always@(*) begin
    case(state)
    s0: if(in) begin
        next_state = s1;
    end
    else begin
       next_state= s0 ;
    end
    s1: if(in) begin
        next_state =s2;
    end
    else begin
        next_state=s0;
    end
    s2: if(in) begin
        next_state=s1;
    end
    else begin
        next_state = s3;
    end

     s3:if(in) begin
        next_state= s1;
        out =1'b1;
    end
    else begin
        next_state=s0;
        out=1'b0;
    end
     default begin
        next_state =1'b0;
        out= 1'b0;
    end
    endcase
end
endmodule


