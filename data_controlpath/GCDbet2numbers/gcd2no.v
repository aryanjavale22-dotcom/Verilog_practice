module data_path(
    input clk,clear,
    input load_a,substract_a,substract_b,
    input [7:0] reg_a,reg_b,
    output reg [7:0]a,b,
    output a_gt_b,a_ls_b,a_eq_b
);
always@(posedge clk or posedge clear) begin
    if(clear) begin
        a<=0;
        b<=0;
    end
    else if(load_a) begin
        a<= reg_a;
        b<=reg_b;
    end
    else if(substarct_a) begin
        a<= a-b;
    end
    else if(substract_b) begin
        b<=b-a;
    end
end

assign a_gt_b = a>b;
assign a_ls_b = a<b;
assign a_eq_b = a=b;
endmodule

module controller(
    input a_gt_b,a_ls_b,a_eq_b,
    input clk,clear,start,
    output substract_a,substract_b,load_a,done
);
reg [2:0]state,next_state;
parameter idel = 3'b000;
load =3'b001;
compare=3'b010;
substract_a=3'b011;
substract_b=3'b100;

always@(posedge clk or posedge clear ) begin
    if(clear) begin
    state<= next_state;
end
else begin
    state<=idel;
end
end
always@(*) begin
    case(state) 
    idel: begin
        if(start) begin
            next_state=load;
        end
        else begin
            next_state=idel;
        end
    end
    load: begin
        load=1;
        next_state=compare;
    end
    compare: begin
        if(a_gt_b) begin
            
            next_state=substract_a;
        end
        else if(a_ls_b) begin
            next_state= substract_b;
        end
        else  begin
            next_state=done;
        end
    end
    substract_a: begin
        substract_a=1;
        next_state= compare;
    end
    substract_b: begin
        substract_b=1;
        next_state=compare;
    end
    done: begin
        done=1;
        next_state=done;
    end
    default: begin
        substract_a=0;
        substract_b=0;
        done=0;
        next_state=idel;
        load=0;
    end
    endcase
end


    



