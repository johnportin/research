load "../PrimaryMonomialIdeal.m2";
load "../IdealToFile.m2";

getPartitionsOfSize = method();
getPartitionsOfSize(ZZ, ZZ) := (partitionInteger, partitionSize) -> {
    return select(partitions partitionInteger, s -> #s == partitionSize);
}

writeIdeal = method();
writeIdeal(Partition, File) := (myPart, myFile) -> {
    outputs := {};
    myIdeal := partitionIdeal(myPart);

    outputs = flatten append(outputs, {myPart, numgens myIdeal, myIdeal});
    return outputs;
}

getPartitionIdeals = method();
getPartitionIdeals(ZZ, ZZ) := (partitionInteger, partitionSize) -> {
    P := getPartitionsOfSize(partitionInteger, partitionSize);
    f := openOutAppend("scripts/testFile");
    apply(P, p -> print writeIdeal(p, f));
}



R = QQ[a,b];
getPartitionIdeals(10, 5);

