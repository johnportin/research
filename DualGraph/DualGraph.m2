needsPackage "Graphs";

dualGraph = method();

dualGraph (MonomialIdeal) := (myIdeal) -> (
    myEdges := {};
    gensList := flatten entries gens myIdeal;
    generatingDegree := (degree gensList_0)_0;
    targetDegree := generatingDegree - 1;

    for gens in gensList ** gensList do {
        gen1 = gens_0;
        gen2 = gens_1;
        currentEdge = set {gen1, gen2};
        gcdDegree = (degree gcd(gen1, gen2))_0;
        if gcdDegree == targetDegree then {
            if not member(currentEdge, myEdges) then {
                myEdges = append(myEdges, currentEdge);
            }
        }
    };

    return graph(myEdges);
);


