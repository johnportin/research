-- Here is a function called myLog
-- It simply return the floor of log(num, base), but we avoid using the built in functions
-- We define it as a method function because we want to instantiate
    -- multiple versions with potentially different inputs

myLog = method();

-- The user should provide a base
myLog (ZZ, ZZ) := (num, base) -> (
    if num < 1 then return 0;
    result := 0;
    current := num;
    while current > 1 do (
        current = current // base;
        result = result + 1;
    );
    return result;
)

-- If the user does not define a base, we take the base as 2
-- and call our already defined log function
myLog(ZZ) := (num) -> (
    return myLog(num, 2)
)

-- You can see the documentation for the log function in M2
-- https://faculty.math.illinois.edu/Macaulay2/doc/Macaulay2-1.17/share/doc/Macaulay2/Macaulay2Doc/html/_log.html

