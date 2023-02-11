load "./PrimaryMonomialIdeal.m2";

-- Returns an ideal equal to the product of frobenius powers of monomial primary ideals
partitionIdeal = method();
partitionIdeal (List) := (powers) -> {
    return product(powers, primaryMonomialIdeal);
}

partitionIdeal(Partition) := (powers) -> {
    return partitionIdeal toList powers;
}

partitionIdeal(Array) := (powers) -> {
    return partitionIdeal toList powers;
}
