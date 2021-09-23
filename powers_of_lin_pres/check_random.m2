-- notify = true;

load "base_ideal.m2";
load "../common_functions/isLinearlyPresented.m2";
load "../common_functions/numMons.m2";
load "../common_functions/randomMonomialIdealSuper.m2";
needsPackage "RandomIdeals";
needsPackage "MonomialOrbits";

-- Initial parameters
deg = 5;

R = QQ[a,b,c,d];
B = baseIdeal(R, deg);
numGensBaseIdeal = #(flatten flatten entries mingens B);

-- Compute number of potential iterations
numIters := numMonomials(R, deg) - numGensBaseIdeal;

for i from 1 to numIters do (
    L = randomMonomialIdealSuper(i:deg, monomialIdeal B, R, 10000);
    -- << "#L = " << #L << endl;
    << "Running " << i << "/" << numIters << endl;

    apply(L, l -> if isLinearlyPresented trim l and not isLinearlyPresented trim l^2 then print l);
)

exit