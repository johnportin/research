testing = true;


--   Computes the index of the first occurance of the substring in string.
contains = method();
contains (String, String) := (string, sub) -> (
    i = 0;
    
    found = false;
    subLength = length sub;
    stringLength = length string;

    while i < stringLength do (
        if substring(string, i, subLength) == sub then (
            return i;
        );
        i = i + 1;
    );
    return -1;

)

--  returns the number of times a particular string occurs in 'string'.
countTotalSubstrings = method();
countTotalSubstrings (String, String) := (string, sub) -> (
    frontIndex = contains(string, sub);
    count = 0;
    k = frontIndex;
    frontIndex = frontIndex + 1;
    while k != -1 do (
        count = count + 1;
        -- print(substring(s, frontIndex), sub, "frontIndex = ", frontIndex, "count = ", count);
        if not contains(substring(string, frontIndex), sub) == -1 then (
            frontIndex = frontIndex + contains(substring(string, frontIndex), sub) + 1;
        )
        else (
            k = -1;
        )
    );
    return count;
)

if testing == true then (
        -- Tests
    s = "11001";

    print("Testing contains: ");
    print(contains(s, "1"), " = 0");
    print(contains(s, "0"), " = 2");
    print(contains(s, "10"), " = 1");
    print(contains(s, "11"), " = 0");
    print("\n\n");

    print("Testing countTotalSubstrings: ");
    print(countTotalSubstrings(s, "1"), " = 3");
    print(countTotalSubstrings(s, "11"), " = 1");
    print(countTotalSubstrings(s, "0"), " = 2");
    print(countTotalSubstrings(s, "01"), " = 1");

    s = "10000000";
    print(countTotalSubstrings(s, "0"), " = 7");

    s = "111111101111";
    print(countTotalSubstrings(s, "1"), " = 11");

    print(countTotalSubstrings("1010100101010", "10"), " = 6");

)
