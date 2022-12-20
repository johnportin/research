load "PrimaryMonomialIdeal.m2";

numParts = 3
R = QQ[a..c];
P = [];

for d in (3..10) do {
    P = flatten append(partitions(d), P);
}

partitionsOfSize = select(P, p -> #p == numParts);
for k in partitionsOfSize do {
    << k << ":  " << numgens(partitionIdeal(k)) << endl;
}