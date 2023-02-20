isLinearlyPresented = method();

isLinearlyPresented (Ideal) := I -> (
  degs := degrees presentation module I;
  degs = unique flatten flatten degs;
  degs = degs ** degs;

  -- for d in degs do (
  --   if abs(d#0 - d#1) != 1 then return false;
  -- );

  -- return true

  degs = for d in degs list abs(d#0 - d#1);
  return max degs == 1;
  )