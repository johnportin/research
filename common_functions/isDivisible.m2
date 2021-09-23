-- Since the "%" operator does not seem to compute divisibliity as expected, I will have to create my own function for this.
-- We will use the exponent vector of the monomials

-- Note: another solution would be to use isSubset and convert the monomials to monomialIdeals.

isDivisible = method();

isDivisible(RingElement, RingElement) := (m1, m2) -> (
    expVector = (flatten exponents m2) - (flatten exponents m1);
    return all(expVector, e -> e >= 0);
)