randomMonomialIdealSuper = method();

randomMonomialIdealSuper (VisibleList, MonomialIdeal, Ring) := (L, B, R) -> (
  -- Make a copy of B to build the new ideal on
  I := B;

  -- Sort list for efficiency
  -- For now, assume L comes in sorted (because there is an issue with
  -- sorting lists of length 1)
  -- L' := sort L;

  currentDegree = L#0;

  -- Grab a basis in the first degree
  m := basis(currentDegree, R);

  -- Convert basis and ideal into sets
  m = set flatten entries m;
  B = set flatten entries mingens B;

  -- Collect just the elements we want to add (In this case, those not in B already)
  B' := m - B;
  missingGens := elements B';

  I = I + ideal( (random missingGens)_{0..(#L - 1)} );

    return trim I;
  )


randomMonomialIdealSuper (VisibleList, MonomialIdeal, Ring, ZZ) := (L, B, R, N) -> (
    I := B;

    m := basis(L#0, R);

    m = set flatten entries m;
    B = set flatten entries mingens B;

    B' := elements (m - B);

    -- I = I + ideal( (random missingGens)_{0..(#L - 1)} );

    K := for i from 1 to N list trim I + ideal( (random B')_{0..(#L - 1)});

    return K;

);

-- R = QQ[a,b,c];
-- I = monomialIdeal(a^3, b^3, c^3);

-- << randomMonomialIdealSuper({3, 3, 3}, I, R) << endl;

-- << timing randomMonomialIdealSuper({3, 3, 3}, I, R, 10000);