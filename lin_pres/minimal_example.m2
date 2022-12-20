load "../common_functions/randomMonomialIdealSuper.m2";
load "../common_functions/isLinearlyPresented.m2";
load "../common_functions/numMons.m2";
load "../powers_of_lin_pres/base_ideal.m2";

load "../lin_pres/N_recursion/N.m2";

deg = 8;

count = 0;
found = false;
total = 0;

K = new MutableHashTable;

R = QQ[a,b,c];
B = monomialIdeal baseIdeal(R, deg);

remainingMons = N(deg) - numgens B;

-- create ideals directory
myDirectoryName = "./minimal/";
if not isDirectory(myDirectoryName) then mkdir(myDirectoryName);

tempfile = concatenate(myDirectoryName, "degree_", toString deg, "_gens_", toString (remainingMons + #B), ".txt");

f = openInOut tempfile;

while found == false do (

    clearOutput;
    count = count + 1000;
    if count % 1000 == 0 then print count;

    temp = randomMonomialIdealSuper(remainingMons:deg, B, R, 1000);

    apply(temp, I -> (
        if isLinearlyPresented I then (
            print I;
            found = true;
            -- print total;

            -- f = tempfile << "";
            f << toString I << endl;
        );
    ))

    -- for I in temp do (
    --     -- if not K#?I then (
    --     -- total = total + 1;
    --     -- K#I = true;

    --     if isLinearlyPresented I then (
    --         found = true;
    --         print total;

    --         f = tempfile << "";
    --         tempfile << toString I << endl;
    --     );

    --     );
    );

f << close;