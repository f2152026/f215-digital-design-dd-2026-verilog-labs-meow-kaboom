// cla64_blocked.v
// A practical 64-bit adder: sixteen 4-bit CLA blocks (your cla4.v),
// chained by feeding block k's carry-out into block (k+1)'s carry-in --
// the same instantiate-and-chain pattern as Task 2's ripple adder, just
// using 4-bit CLA blocks instead of single full adders.
//
// TODO: instantiate 16 cla4 blocks, named block0..block15, e.g.:
//   cla4 block0 (.a(a[3:0]),    .b(b[3:0]),    .cin(cin),  .sum(sum[3:0]),    .cout(c[1]));
//   cla4 block1 (.a(a[7:4]),    .b(b[7:4]),    .cin(c[1]), .sum(sum[7:4]),    .cout(c[2]));
//   ...
//   cla4 block15(.a(a[63:60]),  .b(b[63:60]),  .cin(c[15]),.sum(sum[63:60]),  .cout(cout));

module cla64_blocked(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [14:0] c_out;  // carries BETWEEN blocks: c[1]..c[15]

  // TODO: your sixteen cla4 instances go here.
cla4 block0  (.a(a[3:0]),   .b(b[3:0]),   .cin(cin),       .sum(sum[3:0]),   .cout(c_out[0]));
  cla4 block1  (.a(a[7:4]),   .b(b[7:4]),   .cin(c_out[0]),  .sum(sum[7:4]),   .cout(c_out[1]));
  cla4 block2  (.a(a[11:8]),  .b(b[11:8]),  .cin(c_out[1]),  .sum(sum[11:8]),  .cout(c_out[2]));
  cla4 block3  (.a(a[15:12]), .b(b[15:12]), .cin(c_out[2]),  .sum(sum[15:12]), .cout(c_out[3]));
  cla4 block4  (.a(a[19:16]), .b(b[19:16]), .cin(c_out[3]),  .sum(sum[19:16]), .cout(c_out[4]));
  cla4 block5  (.a(a[23:20]), .b(b[23:20]), .cin(c_out[4]),  .sum(sum[23:20]), .cout(c_out[5]));
  cla4 block6  (.a(a[27:24]), .b(b[27:24]), .cin(c_out[5]),  .sum(sum[27:24]), .cout(c_out[6]));
  cla4 block7  (.a(a[31:28]), .b(b[31:28]), .cin(c_out[6]),  .sum(sum[31:28]), .cout(c_out[7]));
  cla4 block8  (.a(a[35:32]), .b(b[35:32]), .cin(c_out[7]),  .sum(sum[35:32]), .cout(c_out[8]));
  cla4 block9  (.a(a[39:36]), .b(b[39:36]), .cin(c_out[8]),  .sum(sum[39:36]), .cout(c_out[9]));
  cla4 block10 (.a(a[43:40]), .b(b[43:40]), .cin(c_out[9]),  .sum(sum[43:40]), .cout(c_out[10]));
  cla4 block11 (.a(a[47:44]), .b(b[47:44]), .cin(c_out[10]), .sum(sum[47:44]), .cout(c_out[11]));
  cla4 block12 (.a(a[51:48]), .b(b[51:48]), .cin(c_out[11]), .sum(sum[51:48]), .cout(c_out[12]));
  cla4 block13 (.a(a[55:52]), .b(b[55:52]), .cin(c_out[12]), .sum(sum[55:52]), .cout(c_out[13]));
  cla4 block14 (.a(a[59:56]), .b(b[59:56]), .cin(c_out[13]), .sum(sum[59:56]), .cout(c_out[14]));
  cla4 block15 (.a(a[63:60]), .b(b[63:60]), .cin(c_out[14]), .sum(sum[63:60]), .cout(cout));
endmodule
