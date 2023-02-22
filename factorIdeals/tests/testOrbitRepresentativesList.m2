load "MonomialOrbits.m2";

R = QQ[a,b,c];
-- L4 = orbitRepresentatives(R, 3:5); --monomials generated in degree 5 with 4 generators
-- L5 = orbitRepresentatives(R, 4:5); --monomials generated in degree 5 with 5 generators
m3 = flatten entries basis(2, R); --list of monomials in degree 5
L = {monomialIdeal "a2, ab", monomialIdeal "b2, c2"};

<< "Testing orbitRepresentatives(Ring, List, List, ZZ)" << endl;
L3 = orbitRepresentatives(R, L, m3, 1);

<< "#L5=" << #L3 << endl;