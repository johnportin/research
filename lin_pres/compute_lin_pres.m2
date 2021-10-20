-- Read in global parameters:
--      dimRing, deg, 
load "lin_pres/parameters.m2";

load "common_functions/isLinearlyPresented.m2";
load "common_functions/numMons.m2";
load "powers_of_lin_pres/base_ideal.m2";
load "orbit_representatives/MonomialOrbits.m2";
-- needsPackage "MonomialOrbits";

R = QQ[vars(0..(dimRing - 1))];
B = baseIdeal(R, deg);

-- create ideals directory
myDirectoryName = "./lin_pres/ideals/";
if not isDirectory(myDirectoryName) then mkdir(myDirectoryName);

-- create directory for ideals in ring of current dimension
myDirectoryName = concatenate(myDirectoryName, "/dim", toString(dimRing));
if not isDirectory(myDirectoryName) then mkdir(myDirectoryName);

-- create directory for ideals in ring of current dimension and degree
myDirectoryName = concatenate(myDirectoryName, "/deg", toString deg);
if not isDirectory(myDirectoryName) then mkdir(myDirectoryName);



-- readme file will contain any pertinent logging information
readme = "readme.txt";

-- (myDirectoryName | file) << "hihihihi" << close;

numGensBaseIdeal = #(flatten flatten entries mingens B);

-- Compute number of potential iterations
numIters := numMonomials(R, deg) - numGensBaseIdeal;

-- Set up relative paths for 
completeFile = "/complete_list.txt";
linearlyPresentedFile = "/linearly_presented_list.txt";
linearlyPresentedExponentsFile = "/linearly_presented_exponents_list.txt";

found = false;
endEarly = false;

L = monomialIdeal B;

for i from 0 to numIters do (
    if not (endEarly and found) then (
            -- create directory for current number of generators
        tempDirName := concatenate(myDirectoryName, "/gens", toString(i + 1 + numGensBaseIdeal));
        if not isDirectory(tempDirName) then mkdir(tempDirName);

        L = orbitRepresentatives(R, L, 1:deg);
        << "#L = " << #L << endl;

        
        counter = 1;
        for l in L do (
            ( tempDirName | completeFile) << toString l << endl;
            if isLinearlyPresented l then (
                found = true;
                ( tempDirName | linearlyPresentedFile) << toString l << endl;

                -- format and write exponents
                linearlyPresentedExponentsDir = concatenate(tempDirName, "/exponents_formatted");
                if not isDirectory linearlyPresentedExponentsDir then mkdir(linearlyPresentedExponentsDir);
                tempFile = concatenate(linearlyPresentedExponentsDir, "/ideal", toString counter);
                E := apply(flatten entries gens l, e -> flatten flatten exponents e );
                for e in E do (
                    for j from 1 to dimRing - 1 do (
                        tempFile << e#j << " ";
                    );
                    tempFile << endl;
                );

                tempFile << close;
                ( tempDirName | linearlyPresentedExponentsFile ) << E << endl;
            );
            counter = counter + 1;
        );

        -- close all files
        ( tempDirName | completeFile) << close;
        ( tempDirName | linearlyPresentedFile) << close;
        ( tempDirName | linearlyPresentedExponentsFile ) << close;
    )

);




