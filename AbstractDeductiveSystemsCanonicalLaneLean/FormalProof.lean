import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystemStructure

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure FormalProofPackage {A : AdmissibleClass} (D : DeductiveSystemPackage A) where
  proofTreeDefined : Prop
  deductionTheorem : Prop
  provabilityClosed : Prop

structure FormalProofEvidence {A : AdmissibleClass} {D : DeductiveSystemPackage A} (P : FormalProofPackage D) where
  proofTreeDefinedClosed : P.proofTreeDefined
  deductionTheoremClosed : P.deductionTheorem
  provabilityClosedClosed : P.provabilityClosed

def FormalProofClosed {A : AdmissibleClass} {D : DeductiveSystemPackage A} (P : FormalProofPackage D) : Prop :=
  P.proofTreeDefined ∧ P.deductionTheorem ∧ P.provabilityClosed

theorem formal_proof_closed_from_evidence {A : AdmissibleClass} {D : DeductiveSystemPackage A} (P : FormalProofPackage D) (E : FormalProofEvidence P) : FormalProofClosed P :=
  And.intro E.proofTreeDefinedClosed (And.intro E.deductionTheoremClosed E.provabilityClosedClosed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse