load "host/orbit_representatives/MonomialOrbits.m2";
load "host/powers_of_lin_pres/base_ideal.m2";

R = QQ[a,b,c];

deg = 8;
num = 4;
I = baseIdeal(R, deg);


result = monomialIdeal I;
-- print result;

time L =  orbitRepresentatives(R, monomialIdeal I, num:deg)

for i from 1 to num do (
    << "#result = " << #result << endl;
    -- if #result == 0 then (<< "setting result to zero ideal" << endl; result = {monomialIdeal "ab"};);
    time result = orbitRepresentatives(R, result, 1:deg);
    -- apply(result, l -> print("\t", l))
)



