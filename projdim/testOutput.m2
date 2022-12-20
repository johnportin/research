needsPackage "MonomialOrbits"
needsPackage "SymbolicPowers"

R = QQ[a..c];
m = ideal(vars R);
deg = 5;
M = flatten entries gens m^deg;
numSamples = 500;
-- maxNumGens = binomial(#M, deg);

result = {};

for i from 1 to #M do (
    for r from 1 to numSamples do (
        M' := random(M);
        I' = ideal(select(i, M', (temp) -> true));
        result = append(result, I');
    )
)

<< "obtained result, #=" << #result << endl;


-- tally apply(result, r -> pdim (R^1/r));
result2 = apply(result, r -> (numgens r, pdim(R^1/r)));
-- result2 = apply(result, r -> (numgens r, bigHeight ideal r));

<< "converted to (numgens, pdim)" << endl;


-- Get max numgens = R0 and max projective dimension = R1
R0 = max(apply(result2, r -> r#0));
R1 = max(apply(result2, r -> r#1));

makeDict = (L) -> (
    D = new MutableHashTable;
    apply(L, l -> (
        name := concatenate("(", 
            toString(pdim (R^1/l)),
            -- toString(bigHeight ideal l),
            ",",
            toString(numgens l),
            ")"
        );
        if not D#?name then D#name = 1 else D#name = D#name + 1;
    ));
    return D
)

makeName = (i, j) -> (
    name := concatenate("(", 
            toString i,
            ",",
            toString j,
            ")"
        );
        return name;
)

makeTable = (D, d1, d2) -> (
    -- D a dictionary of pairs "(i,j)" and corresponding integer values
    -- d1 and d2 are the dimensions for the x and y axis
    T := table(d1, d2, (i, j) -> (
        if i == 0 then return j;
        if j == 0 then return i;
        name := makeName(i, j);
        return if D#?name then D#name else 0;
    ));
    return T
)

myTable = makeTable(makeDict(result), R1 + 1, R0 + 1);
print netList myTable
numberOfVars = dim R;
for r from 0 to numberOfVars do (print(binomial(numberOfVars + deg - 1 - r, numberOfVars - 1 - r)));

f = "testfile" << "";
X = {};
Y = {};

for entry in result2 do (
    X = append(X, entry#0);
    Y = append(Y, entry#1);
)

f << X << endl << Y << close;



