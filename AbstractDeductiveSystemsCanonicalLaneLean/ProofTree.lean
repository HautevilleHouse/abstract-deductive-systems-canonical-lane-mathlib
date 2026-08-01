import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure ProofTreePackage {D : DeductiveSystemPackage} {I : InferencePackage D} where
  proofTree : Type u
  proofTreeStructure : Prop
  proofTreeSoundness : Prop
  proofTreeCorrectness : Prop
  proofTreeStructureClosed : Prop
  proofTreeSoundnessClosed : Prop
  proofTreeCorrectnessClosed : Prop

structure ProofTreeEvidence {D : DeductiveSystemPackage} {I : InferencePackage D} (P : ProofTreePackage D I) where
  proofTreeStructureClosedClosed : P.proofTreeStructureClosed
  proofTreeSoundnessClosedClosed : P.proofTreeSoundnessClosed
  proofTreeCorrectnessClosedClosed : P.proofTreeCorrectnessClosed

def ProofTreeClosed {D : DeductiveSystemPackage} {I : InferencePackage D} (P : ProofTreePackage D I) : Prop :=
  P.proofTreeStructureClosed ∧ P.proofTreeSoundnessClosed ∧ P.proofTreeCorrectnessClosed

theorem proof_tree_closed_from_evidence {D : DeductiveSystemPackage} {I : InferencePackage D}
    (P : ProofTreePackage D I) (E : ProofTreeEvidence P) : ProofTreeClosed P := by
  exact And.intro E.proofTreeStructureClosedClosed
    (And.intro E.proofTreeSoundnessClosedClosed E.proofTreeCorrectnessClosedClosed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse
