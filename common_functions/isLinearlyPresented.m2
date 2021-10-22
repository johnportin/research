isLinearlyPresented = method();

isLinearlyPresented (Ideal) := I -> (
  degs := degrees presentation module I;
  degs = unique flatten flatten degs;
  degs = degs ** degs;

  degs = for d in degs list abs(d#0 - d#1);

  -- print maxDegree;

  -- maxDegree := apply(degs', d -> abs(d#0 - d#1));
  -- maxDegree = max maxDegree;
  return max degs == 1;
  )


-- this function is deprecated (possibly due to an update?)
-- Test it against the ideal (x^3, y^3) in R = QQ[x, y] to
-- see that an ideal clearly not linearly presented is determined to be linear


-- isLinearlyPresented = I -> (
--   degs := last degrees presentation module I;
--   --degs := last degrees presentation module trim I;
--   #unique degs == 1
--   )