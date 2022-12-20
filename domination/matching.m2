/// 
Pseudo code for Ford-Fulkerson
    For each edge:
        set edge flow to 0
    while there is a path p in the residual graph from s to t:
        additional_flow = min {flow of each edge in p}
        for each edge (u,v) in p:
            if (u,v) is an edge of the digraph:
                update flow with additional flow 
            else:
                update flow of (v,u) as (v,u).flow -= additional_flow
///


-- This code taken directly from Graphs.m2 from the official repository
breadthFirstSearch = method()
breadthFirstSearch (Digraph, Thing) := List => (G, v) -> (
    V := vertexSet G;
    if not member(v, V) then error "";

    -- Q holds each vertex and the step at which it first occurs?
    Q := {{v, 0}};
    V = V - set {v};
    i := 0;
    while i < #Q do (
        C := select(toList children(G, first Q_i), u -> member(u, V))
        << "C=" << C << endl;
        Q = Q | apply(C, c -> {c, last Q_i + 1});
        << "Q=" << Q << endl;
        V = V - set C;
        i = i + 1;
        );
    P := partition(last, Q);
    apply(sort keys P, k -> first \ P#k)
    )

BFS = breadthFirstSearch



