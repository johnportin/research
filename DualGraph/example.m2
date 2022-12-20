load "DualGraph.m2";
load "PrimaryMonomialIdeal.m2";

R = QQ[a,b];

m1 = primaryMonomialIdeal 1;
m2 = primaryMonomialIdeal 2;
m4 = primaryMonomialIdeal 4;
m8 = primaryMonomialIdeal 8;

K = m1 * m2 * m4;

f = "ideal.txt" << "";