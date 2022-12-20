load "IdealToFile.m2";
load "PrimaryMonomialIdeal.m2";

R = QQ[a,b,c,d];

for i in (3..10) do {
    partitionToFile(i, R);
}

exit();