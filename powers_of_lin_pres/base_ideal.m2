-- Computes the base ideal of monomials supported on two variables
-- forming an ideal in which all other possible linearly
-- presented ideals live



baseIdeal = method();

baseIdeal (Ring, ZZ) := (myRing, myDegree) -> (
    V := flatten entries vars myRing;
    result := ideal(0);

    -- compute all unique pairs of variables
    variablePairs := for v in V ** V list (if v#0 > v#1 then v else continue);

    idealPairs := apply(variablePairs, v -> ideal(v#0, v#1));
    idealPairs = apply(idealPairs, i -> i^myDegree);

    result = trim sum(idealPairs);
    return result;
);