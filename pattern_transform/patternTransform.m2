load "../common_functions/contains.m2";
load "../lin_pres/N_recursion/N.m2";

SHat = [];
S = [];

for i from 0 to 100 do (
    S = append(S, N(i));
);

SHat = append(SHat, S#0);

for i from 1 to 100 do (
    temp = 0;

    iBinary = toBinary(i);

    for k from 0 to i - 1 do (
        kBinary = toBinary(k);
        temp = temp + SHat#k * countTotalSubstrings(iBinary, kBinary);
    );

    SHat = append(SHat, S#i - temp);
);

for i from 0 to 100 do (
    print(i, toBinary i, S#i, SHat#i);
);

