-- rewrite the logic to sortedDegreeList to use the corollary about degrees
-- and maximal ideals. This should improve performance, although, performance
-- has not been an issue so far. 

-- Find a return value that better represents the information you want. 
-- Perhaps returning just the list that produces the maximal ideal would
-- be sufficient. Or returning (I, d) where d is the power of the maximal 
-- ideal that can be factored out. 

load "PrimaryMonomialIdeal.m2";

partitionIdealReduce = (degreeList, myRing) -> {
    sortedDegreeList := sort(degreeList);
    ringDimension := dim R;
    I := ideal(1_R); -- product of ideals so far
    M := ideal(1_R); -- power of maximal ideal so far
    m := ideal(vars R); -- the maximal ideal
    totalDegree := 0;
    sortedDegreeListCopy := sortedDegreeList;



    for i in sortedDegreeList do {
        totalDegree = totalDegree + i;
        M = M * m^i;
        I = I * partitionIdeal({i}); 
        totalDegree = totalDegree + i;

        if (M != I) then {
            return {sortedDegreeList, sortedDegreeListCopy};
        } else {
            sortedDegreeListCopy = drop(sortedDegreeListCopy, 1);
        }
    };

    return -1;
}

