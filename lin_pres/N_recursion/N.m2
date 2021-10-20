N = method();

N (ZZ) := g -> (
    if g < 1 then return 0
    else if g == 1 then return 3
    else if g == 2 then return 6
    else if even g then return (2*N(g // 2) + N( (g // 2 ) - 1 ) - 1)
    else return 3*N( g // 2 );
)


toBinary = method();

toBinary (ZZ, String) := (z, result) -> (

    if z == 0 then return result;

    if odd z then (result = concatenate("1", result))
    else result = concatenate("0", result);

    return toBinary(z // 2, result);
)

toBinary ZZ := z -> (toBinary(z, ""));


B = method();

B0 = matrix {{2, 1, -1}, {0, 3, 0}, {0, 0, 1}};
B1 = matrix {{3, 0, 0}, {2, 1, -1}, {0, 0, 1}};
V0 = matrix {{1}, {0}, {1}};
-- V1 = matrix {{3}, {1}, {1}};
-- V2 = matrix {{6}, {3}, {1}};
-- V3 = matrix {{9}, {6}, {1}};


B ZZ := z -> (
    if z < 0 then return -1;
    if z == 0 then return 1;
    -- if z == 1 then return 3;
    -- if z == 2 then return 6;
    -- if z == 3 then return 9;

    z = reverse toList toBinary z;
    temp = 1;

    for i from 0 to length z - 1 do (
        if z#i == "0" then (
            temp = temp * B0;
        ) else (
            temp = temp * B1;
        );
    );

    return (temp * V0)_0_0;
)