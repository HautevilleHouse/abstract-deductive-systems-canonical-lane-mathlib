import AbstractDeductiveSystemsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.closureProp ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse