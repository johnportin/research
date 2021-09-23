load "base_ideal.m2";
load "../common_functions/isLinearlyPresented.m2";
load "../common_functions/numMons.m2";
needsPackage "RandomIdeals";
needsPackage "MonomialOrbits";

-- parameters
deg = 4;

R = QQ[a,b,c,d];
B := baseIdeal(R, deg);
numGensBaseIdeal = #(flatten flatten entries mingens B);

-- Compute number of potential iterations
numIters := numMonomials(R, deg) - numGensBaseIdeal;

for i from 0 to numIters do (
    L = orbitRepresentatives(R, B, i:deg);
    << "#L = " << #L << endl;

    -- apply(L, l -> if isLinearlyPresented l then (
    --     if isLinearlyPresented l^2 then (print l)
    --     )   
    -- );

    K = apply(L, l -> if isLinearlyPresented l then (
        if isLinearlyPresented l^2 then (
            return 2;
        )
        else (
            print "OH NO FOUND ONE!!!!!!";
            print l;
            exit;);


    )
    else (return 0;));

    -- print K;
);