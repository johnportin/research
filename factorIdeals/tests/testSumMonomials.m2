load "MonomialOrbits.m2";
load "sumMonomialsNew.m2";

R = QQ[a,b,c];
L = orbitRepresentatives(R, 5:5);
b = flatten entries basis(5, R);

L' = for l in L list toLis l;
b' = for l in b list toLis l;

<< "Testing sumMonomialsLisHash ----" << endl;
for i in 0..10 do (
    time sumMonomialsLisHash(L', b');
);

<< "Testing sumMonomialsLisNew ----" << endl;
for i in 0..10 do (
    time sumMonomialsLisNew(L', b');
);
