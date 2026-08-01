import AbstractDeductiveSystemsCanonicalLaneLean.AxiomaticSystem
import AbstractDeductiveSystemsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DeductiveFoundation where
  system : AxiomaticSystem
  systemEvidence : AxiomaticSystemEvidence system
  admissible : AdmissibleClass
  bridgeAndGateClosed : ConstrainedDeductiveClosure admissible

def DeductiveFoundationClosed (F : DeductiveFoundation) : Prop :=
  AxiomaticSystemClosed F.system ∧ ConstrainedDeductiveClosure F.admissible

theorem deductive_foundation_closed_evidence (F : DeductiveFoundation) :
    DeductiveFoundationClosed F := by
  exact And.intro (axiomatic_system_closed_from_evidence F.system F.systemEvidence) F.bridgeAndGateClosed

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse
