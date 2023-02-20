needsPackage "MonomialOrbits";
load "../common_functions/isLinearlyPresented.m2";

nonZeroLength = L -> (
    #select(L, x -> x != 0)
)

baseIdeal = method();
baseIdeal(Ring, ZZ) := MonomialIdeal => (R, n) -> (
    B := flatten entries basis(n, R);
    B = apply(B, b -> toLis(b));
    B = select(B, b -> if nonZeroLength(b) == 2 or nonZeroLength(b) == 1 then true else false);
    return fromLis(R, B);
)

-- Copied from MonomialOrbits.m2
toLis = method();
toLis RingElement := List => m -> (exponents m)_0
toLis MonomialIdeal := List => I -> if I == 0 then {{}} else 
				    sort( I_*/(m-> toLis m))

toMonLis = (S,e) -> product(#e, i-> S_i^(e_i))

fromLis = method()
fromLis (Ring, List) := MonomialIdeal => (S,L) -> if L === {} then monomialIdeal 0_S else 
                                                              monomialIdeal apply(L,e-> toMonLis (S,e))
-- End copy from MonomialOrbits.m2

R = QQ[a,b,c];
d = 8;
result = {};
num=1;

while true do {
    << "Trying degree " << d << " with " << num << " gens." << endl;
    b = baseIdeal(R, d);
    -- num = numgens b + 1;
    L = orbitRepresentatives(R, b, num:d);
    for F in L do {
        if isLinearlyPresented(F) then {
            result = append(result, F);
        }
    };

    if #result > 0 then {
        << "Found a linearly presented monomial ideal with numgens=" << numgens b + num << endl;
        << "The ideal(s): ";
        for F in result do {
            << "\t" << toString F << endl;
        };
        break;
    };
    
    num = num + 1;
}



