R = QQ[x, y, z];
myIdeal = (ideal(x, y, z))^2;

gensList = flatten entries gens myIdeal;

generatingDegree = (degree gensList_0)_0;
targetDegree = generatingDegree - 1;

myEdges = [];

for gen1 in gensList do {
    for gen2 in gensList do {
        currentEdge = set {gen1, gen2};
        gcdDegree = (degree gcd(gen1, gen2))_0;
        if gcdDegree == targetDegree then {
            if not member(currentEdge, myEdges) then {
                myEdges = append(myEdges, currentEdge);
            }
        }
    }
}

print myEdges;