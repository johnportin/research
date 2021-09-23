-- notify = true;

load "base_ideal.m2";
load "../common_functions/isLinearlyPresented.m2";
load "../common_functions/numMons.m2";
load "../common_functions/randomMonomialIdealSuper.m2";
load "../common_functions/isDivisible.m2";
needsPackage "RandomIdeals";
needsPackage "MonomialOrbits";

-- Initial parameters
deg = 5;

R = QQ[a,b,c];
B = baseIdeal(R, deg);
numGensBaseIdeal = #(flatten flatten entries mingens B);

-- find minimally generated linearly presented ideal

-- Compute number of potential iterations
numIters := numMonomials(R, deg) - numGensBaseIdeal;

for i from 1 to numIters do (
    << "Running " << i << "/" << numIters << endl;
    L = orbitRepresentatives(R, B, i:deg);
    << "Found " << #L << " ideals" << endl;

    -- Iterate though ideals looking for problem paths
    for l in L do (

        if not isLinearlyPresented(l) then continue;

        << flatten flatten entries mingens l << endl;

        -- Get a list of generators of l 
        lGens := flatten flatten entries mingens l;

        -- Iterate through pairs of generators. 
        numGens = #lGens;

        -- for i from 0 to numGens -2 do (
        --     for j from 1 to (numGens - 1) do (
        --         ijLCM = lcm(lGens#i, lGens#j);
        --         << "lcm(" << lGens#i << " " << lGens#j << ") = " << ijLCM << endl;
        --     )
        -- )

        for i from 0 to numGens - 4 do (
            for j from i + 1 to numGens - 3 do (
                for k from j + 1 to numGens - 2 do (
                    for t from k + 1 to numGens - 1 do (
                        

                        startPoint := lGens#i * lGens#j;
                        endPoint := lGens#k * lGens#t;

                        waypoint1 := lGens#j * lGens#k;
                        waypoint2 := lGens#i * lGens#k;
                        waypoint3 := lGens#j * lGens#t;
                        waypoint4 := lGens#i * lGens#t;
                        waypoints := {waypoint1, waypoint2, waypoint3, waypoint4};

                        downSetGenerator := lcm(startPoint, endPoint);

                        if all(waypoints, w -> isDivisible(w, downSetGenerator) == false) then (
                            << (i, j, k, t) << ": " << "bad waypoints!!!!!------------------------------" << endl << "\t" << toString startPoint << ", " << toString endPoint << ", " << toString waypoint1 << ", " << toString waypoint2 << endl;

                        )

                        -- if isDivisible(waypoint1, downSetGenerator) == false and isDivisible(waypoint2, downSetGenerator) == false then (
                        --     << (i, j, k, t) << ": " << "bad waypoints!!!!!------------------------------" << endl << "\t" << toString startPoint << ", " << toString endPoint << ", " << toString waypoint1 << ", " << toString waypoint2 << endl;
                        -- )
                        -- if isDivisible(waypoint1, downSetGenerator) then (
                        --     << "waypoint1: " << waypoint1 << endl;
                        -- ) else if isDivisible(waypoint2, downSetGenerator) then (
                        --     << "waypoint2: " << waypoint2 << endl;
                        -- ) else (
                        --     << "bad waypoints!!!!!------------------------------" << endl << "\t" << toString startPoint << ", " << toString endPoint << ", " << toString waypoint1 << ", " << toString waypoint2 << endl;
                        -- )
                    )
                )
            ) 
        )
    )
)