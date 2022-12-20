stronglyDivides = method();

stronglyDivides(RingElement, RingElement) := (mon1, mon2) -> (
    if ring mon1 =!= ring mon2 then {
        print("Monomials are from incomparable rings");
    } else {
        -- Convert ring elements to their exponent lists
        e1 := flatten exponents mon1;
        e2 := flatten exponents mon2;
        -- print(e1, e2);

        -- Check strong division criterion
        for i from 0 to length(e1) - 1 do (
            -- << "Comparing " << e1#i << " to " << e2#i << endl;
            if e1#i != 0 and e1#i >= e2#i  then return false;
        );

        return true;
    };


);

isDominant = method();

isDominant (RingElement, List) := (mon, gens) -> (
    -- Remove mon from gens if necessary
    newGens = delete(mon, gens);

    -- Convert gens to exponents
    expGens := flatten apply(newGens, g -> exponents g);
    expMon := flatten exponents mon;
    domSet := {};

    -- << "expGens=" << expGens << endl << "expMon=" << expMon << endl;
    
    for i from 0 to length expMon - 1 do (
        -- create exponent list for each variable
        temp := for g in expGens list (
            -- print g#i;
            g#i
        );
        -- << "temp = " << temp << endl;

        -- Check dominance in this variable
        if all(temp, t -> t < expMon#i) then (
            -- << g << " is dominant in " << entries (vars R)_0 << endl;
            domSet = append(domSet, (entries (vars R)_i)#0);
        );
    );

    return domSet;

    -- << mon << " is dominant in " << gens << endl;    
);

-- Helper function to assign for each domSet a variable. Ensures that
-- the given monomials cover uniquely the variables in their combined domSets.
uniqueAssign List = domSets -> (

)



R = QQ[a,b,c];

<< "Testing stronglyDivides:" << endl;
n = a*b;
<< "a*b strongly divides a^2*b^2: " << stronglyDivides(a*b, a^2*b^2) << endl;
<< "a strongly divides a*b: " << stronglyDivides(a, a*b) << endl;
<< "a strongly divides b: " << stronglyDivides(a, b) << endl;

<< endl << "Testing isDominant: " << endl;

-- Testing isDominant
G = {a^2*b, a*b^3*c, b*c^2, a^2*c^2};
<< "a*b^3*c is dominant in " << G << ": domSet = " << isDominant(a*b^3*c, G) << endl;
<< "a*b is not dominant in " << G << ": domSet = " << isDominant(a*b, G) << endl;
<< "a^3*b^4 is dominant in " << G << ": domSet = " << isDominant(a^3*b^4, G) << endl;



exit;
