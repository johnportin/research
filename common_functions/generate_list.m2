load "../powers_of_lin_pres/base_ideal.m2";
load "./randomMonomialIdealSuper.m2";
load "./isLinearlyPresented.m2";

generateList = method();

generateList (Ring, ZZ, ZZ, ZZ) := (R, num, deg, iters) -> (
    B := monomialIdeal baseIdeal(R, deg);
    L := randomMonomialIdealSuper(num:deg, B, R, iters);

    H = new MutableHashTable from apply(L, l -> {sort gens l, null}); 

    return H;
)