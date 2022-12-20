primaryMonomialIdeal = method();

primaryMonomialIdeal (ZZ) := (d) -> (
    idealString := "";
    ringVars := flatten entries vars R;

    for var in ringVars do {
        idealString = concatenate(idealString, toString(var), toString(d), ", ");
    };

    return monomialIdeal idealString;
    
);

partitionIdeal = method();

partitionIdeal (List) := (powers) -> {
    return product(powers, primaryMonomialIdeal);
}

partitionIdeal(Partition) := (powers) -> {
    partitionIdeal toList powers;
}

partitionIdeal(Array) := (powers) -> {
    partitionIdeal toList powers;
}
