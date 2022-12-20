idealToFile = method();

idealToFile (MonomialIdeal, Ring) := (myIdeal, R) -> (
    myIdealGens := flatten entries gens myIdeal;

    maxDegree := {degree myIdealGens_0}_0_0;
    allGens := flatten entries basis(maxDegree, R);

    myIdealExps := flatten apply(myIdealGens, g -> exponents g);
    -- myIdealExpsReduce := apply(myIdealExps, g -> {g_0, g_1});

    missingGens := toList(set(allGens) - set(myIdealGens));
    missingGensExps := flatten apply(missingGens, g -> exponents g);

    f := "output.txt" << "name " << toString(myIdeal) << endl;
    f << "generators " << demark(",", apply(myIdealExps, e -> expToString(e))) << endl;
    f << "missing " << demark(",", apply(missingGensExps, e -> expToString(e)));
    close(f);
);

idealToFile (MonomialIdeal, Ring, File) := (myIdeal, R, f) -> (
    myIdealGens := flatten entries gens myIdeal;

    maxDegree := {degree myIdealGens_0}_0_0;
    allGens := flatten entries basis(maxDegree, R);

    myIdealExps := flatten apply(myIdealGens, g -> exponents g);

    missingGens := toList(set(allGens) - set(myIdealGens));
    missingGensExps := flatten apply(missingGens, g -> exponents g);

    f << "name " << toString(myIdeal) << endl;
    f << "generators " << demark(",", apply(myIdealExps, e -> expToString(e))) << endl;
    f << "missing " << demark(",", apply(missingGensExps, e -> expToString(e))) << endl;
);

expToString = method();
expToString (List) := (expList) -> (
    return demark("/", apply(expList, e -> toString e));
);

partitionToFile = method();

partitionToFile(ZZ, Ring) := (myInt, myRing) -> {
    myPartitions := partitions myInt;
    partitionIdeals := [];
    for myPartition in myPartitions do {
        result := ideal 1_myRing;
        apply(myPartition, p -> result = result * primaryMonomialIdeal p);
        partitionIdeals = append(partitionIdeals, {myPartition, monomialIdeal result});
    };

    myFile = openOutAppend "output.txt";

    for i in partitionIdeals do {
        myFile << "partition " << toString(toSequence i_0) << endl;
        idealToFile(i_1, R, myFile);
    };
    close myFile;
};