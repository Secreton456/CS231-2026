module fourbit_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire       cin,
    output wire [3:0] sum,
    output wire       cout
);
    wire carry[3:0];
    adder uut(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry[0])
    );
    adder uut1(
        .a(a[1]),
        .b(b[1]),
        .cin(carry[0]),
        .sum(sum[1]),
        .cout(carry[1])
    );
    adder uut2(
        .a(a[2]),
        .b(b[2]),
        .cin(carry[1]),
        .sum(sum[2]),
        .cout(carry[2])
    );
    adder uut3( 
        .a(a[3]),
        .b(b[3]),
        .cin(carry[2]),
        .sum(sum[3]),
        .cout(carry[3])
    );
    assign cout = carry[3];
endmodule