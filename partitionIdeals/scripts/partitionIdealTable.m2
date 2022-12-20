load "PrimaryMonomialIdeal.m2";

printPartition = method();
printPartition(Sequence, ZZ, ZZ) := (p, numVars, numGens) -> {
    << p << ", " << endl << "\t" << "numvars=" << numVars << endl << "\t" << "numgens=" << numGens << endl;
}

printPartition(Sequence, ZZ) := (p, numGens) -> {
    << p << ", " << endl << "\t" << endl << "\t" << "numgens=" << numGens << endl;
}

printPartition(Partition, ZZ, ZZ) := (p, numVars, numGens) -> {
    printPartition(toSequence(p), numVars, numGens);
}

printPartition(Partition, ZZ) := (p, numGens) -> {
    << p << ", " << endl << "\t" << endl << "\t" << "numgens=" << numGens << endl;
}

listPartitionsFixedSize = method();
listPartitionsFixedSize(ZZ, ZZ, Ring) := (num, maxDegree, S) -> {
    << "Partitions in " << vars(S) << " with " << num << " parts, max degree " << maxDegree << endl;

    M := new MutableHashTable;

    for d in (1..maxDegree) do {
        P := select(partitions(d), p -> #p == num);
        for p in P do {
            n := numgens(partitionIdeal(p));
            if gcd(toList p) != 1 then {
                continue
            }
            else if not M#?n then {
                M#n = {p};
            } else {
                M#n = append(M#n, p);
            }
        };
    };
    return M;
}



R = QQ[a,b];
for f in (2..5) do {
    R = QQ[vars(0..(f-1))];

    for d in (2..(2*f)) do {
        M := listPartitionsFixedSize(d, 10, R);
        for k in sort(keys(M)) do {print(k); scan(M#k, m -> << "\t" << toList(m) << endl)};
    }
}