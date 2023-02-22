
sumMonomialsNew = method()
sumMonomialsNew(List, List) := List => (L1, L2) -> (
    --L1 list of monomial ideal
    --L2 list of monomials
    --return list of monomial ideals I' where 
    --I' is an ideal I in L1 with a monomial from L2 adjoined 
    --that is not in the ideal I
    --
    --sorted.
    unique flatten for I in L1 list (
        for m in L2 list (
            if m %  I != 0 then I+monomialIdeal m
            else continue
            )
        )
    )

sumMonomialsHash = method();
sumMonomialsHash(List, List) := List => (L1, L2) -> (
    --L1 list of monomial ideal
    --L2 list of monomials
    --return list of monomial ideals I' where 
    --I' is an ideal I in L1 with a monomial from L2 adjoined 
    --that is not in the ideal I
    --
    --sorted.

    H = new MutableHashTable;
    for I in L1 list (
        for m in L2 do (
            if m %  I != 0 then (
                I' := I+monomialIdeal m;
                if not H#?I' then H#I' = true;
                )
            else continue
            );
        );
    return keys H;
    )

sumMonomialsLisNew = method()
sumMonomialsLisNew(List, List) := List => (L1, L2) -> (
    --L1: list of lists of lists, representing a list of monomial ideals, or a list representing a single
    --monomial ideal.
    --L2: list of lists, representing monomials
    --return list of lists L of lists; where 
    --returns the list of monomial ideals I, each an ideal I' from L1 with a "monomial" from L2 adjoined 
    --that is not divisible by any monomial in I',
     unique flatten for I in L1 list (
        for m in L2 list if I == {{}} then {m} else
            if notIn(m, I) then sort (I | { m })
            else continue
))

sumMonomialsLisHash = method()
sumMonomialsLisHash(List, List) := List => (L1, L2) -> (
    --L1: list of lists of lists, representing a list of monomial ideals, or a list representing a single
    --monomial ideal.
    --L2: list of lists, representing monomials
    --return list of lists L of lists; where 
    --returns the list of monomial ideals I, each an ideal I' from L1 with a "monomial" from L2 adjoined 
    --that is not divisible by any monomial in I',
    H = new MutableHashTable;
    for I in L1 do (
        for m in L2 do (
            if I == {{}} then (
                if not H#?m then H#m = true;
                )
            else if notIn(m, I) then (
                I' := sort (I | { m });
                if not H#?I' then H#I' = true;
                )
            else continue
            );
        );
    return keys H;
)


--first methods for converting between monomial ideals and lists of lists
toLis = method()
toLis RingElement := List => m -> (exponents m)_0
toLis MonomialIdeal := List => I -> if I == 0 then {{}} else 
                                    --reverse sort( I_*/(m-> toLis m))
				    sort( I_*/(m-> toLis m))

toMonLis = (S,e) -> product(#e, i-> S_i^(e_i))

fromLis = method()
fromLis (Ring, List) := MonomialIdeal => (S,L) -> if L === {} then monomialIdeal 0_S else 
                                                              monomialIdeal apply(L,e-> toMonLis (S,e))

notIn = method()
notIn(List, List) := Boolean => (m, L2) -> (
    --returns true if m is not "divisible" by any element of L2.
    if L2 == {{}} then return true;
    diffs := apply(L2, n -> m-n);
    all(diffs, L -> min L < 0)
    )

