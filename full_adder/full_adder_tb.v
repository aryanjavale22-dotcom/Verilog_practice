module testbench;
reg a,b,cin;
wire s,cout;
fulladd uut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial 
    begin
    $dumpfile("fulladd.vcd");
    $dumpvars(0, testbench);
    $monitor($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
    #5 a=0;b=0;cin=0;
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=0;b=1;cin=1;
    #5 a=1;b=0;cin=0;
    #5 a=1;b=0;cin=1;
    #5 a=1;b=1;cin=0;
    #5 a=1;b=1;cin=1;
    #5 $finish ;
    end
endmodule


    
    