clear all;
data=[1	1	0	1	1;
1	1	0	0	2;
1	0	0	1	2;
0	0	1	1	1;
1	0	0	0	1;
0	1	0	1	2;
0	1	0	0	2;
1	0	1	1	1;
0	1	1	1	1;
1	0	1	0	1];
veri=[data(:,1) data(:,2) data(:,3) data(:,4)];
sinif=[data(:,5)];
tree1 = buildIncrementalTree(veri, sinif);
tree2 = buildDecisionTree(data,1);