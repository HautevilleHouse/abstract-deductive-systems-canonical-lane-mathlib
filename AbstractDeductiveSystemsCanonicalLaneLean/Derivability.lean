import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystem
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DerivabilityPackage {D : AbstractDeductiveSystem} (P : ProofCalculus D) where
  derivable_equivalent_to_calculus : Prop
  soundness : Prop
  completeness : Prop
  derivable_equivalent_to_calculus_closed : derivable_equivalent_to_calculus
  soundness_closed : soundness
  completeness_closed : completeness

structure DerivabilityEvidence {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (DP : DerivabilityPackage P) where
  equivalence_closed : DP.derivable_equivalent_to_calculus_closed
  soundness_closed : DP.soundness_closed
  completeness_closed : DP.completeness_closed

def DerivabilityClosed {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (DP : DerivabilityPackage P) : Prop :=
  DP.derivable_equivalent_to_calculus_closed ∧ DP.soundness_closed ∧ DP.completeness_closed

theorem derivability_closed_from_evidence {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (DP : DerivabilityPackage P) (E : DerivabilityEvidence DP) : DerivabilityClosed DP := by
  exact And.intro E.equivalence_closed (And.intro E.soundness_closed E.completeness_closed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse