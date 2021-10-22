numMonomials = method();

numMonomials(Ring, ZZ) := (R, D) -> (
    numVars := #(flatten entries vars R);
    return binomial(numVars + D - 1, D);
);