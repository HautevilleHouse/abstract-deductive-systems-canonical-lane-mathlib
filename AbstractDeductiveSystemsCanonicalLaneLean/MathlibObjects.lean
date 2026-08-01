import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DeductiveSystemObject where
  carrier : Type
  language : Type
  formulas : carrier → Prop
  axioms : Set formulas
  inferenceRules : Set (List formulas → formulas)
  consistency : Prop
  completeness : Prop
  conclusion : consistency ∧ completeness

def DeductiveWitnessClosed (O : DeductiveSystemObject) : Prop :=
  O.conclusion

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse