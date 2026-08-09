module fourbit_comparator (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire eq,
    output wire gt,
    output wire lt
);
    wire req[3:0];
    wire rgt[3:0];
    wire rlt[3:0];

    comparator c3(
        .a(a[3]),
        .b(b[3]),
        .eq(req[3]),
        .gt(rgt[3]),
        .lt(rlt[3])
    );
    
    comparator c2(
        .a(a[2]),
        .b(b[2]),
        .eq(req[2]),
        .gt(rgt[2]),
        .lt(rlt[2])
    );

    comparator c1(
        .a(a[1]),
        .b(b[1]),
        .eq(req[1]),
        .gt(rgt[1]),
        .lt(rlt[1])
    );

    comparator c0(
        .a(a[0]),
        .b(b[0]),
        .eq(req[0]),
        .gt(rgt[0]),
        .lt(rlt[0])
    );

    assign eq = req[3] & req[2] & req[1] & req[0];
    assign gt = rgt[3] | (req[3] & rgt[2]) | (req[3] & req[2] & rgt[1]) | (req[3] & req[2] & req[1] & rgt[0]);
    assign lt = ~(eq | gt);


endmodule