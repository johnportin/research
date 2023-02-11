-- Methods for producing primary monomial ideals of degree d
primaryMonomialIdeal = method();
primaryMonomialIdeal (ZZ) := (d) -> (
    idealString := "";
    ringVars := flatten entries vars R;

    for var in ringVars do {
        idealString = concatenate(idealString, toString(var), toString(d), ", ");
    };

    return monomialIdeal idealString;
);

primaryMonomialIdeal (ZZ, List, PolynomialRing) := (d, varsList, myRing) -> (
    -- Create a primary ideal in the variables varList each of degree d in the given ring. 

    -- guard statements to make sure list elements are strings represnting variables in the ring
    if any(varsList, v -> class v =!= String) then throw error "Expected all list elements to be strings";
    ringVarsList := flatten entries vars myRing;
    ringVarsList = apply(ringVarsList, v -> toString(v));
    if not isSubset(varsList, ringVarsList) then throw error "Expected arguments to to contains a list of strings of ring variables";

    idealString := "";
    for var in varsList do {
        idealString = concatenate(idealString, toString(var), toString(d), ",");
    };

    return monomialIdeal idealString;
) 
