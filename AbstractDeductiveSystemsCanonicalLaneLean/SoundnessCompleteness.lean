import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystem
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure SoundnessCompletenessPackage {D : AbstractDeductiveSystem}
    {P : ProofCalculus D} (DP : DerivabilityPackage P) where
  syntactic_consistency_implies_semantic : Prop
  semantic_entailment_implies_derivability : Prop
  syntactic_consistency_implies_semantic_closed : syntactic_consistency_implies_semantic
  semantic_entailment_implies_derivability_closed : semantic_entailment_implies_derivability

structure SoundnessCompletenessEvidence {D : AbstractDeductiveSystem}
    {P : ProofCalculus D} {DP : DerivabilityPackage P}
    (SC : SoundnessCompletenessPackage DP) where
  syntactic_consistency_semantic_closed : SC.syntactic_consistency_implies_semantic_closed
  semantic_entailment_derivability_closed : SC.semantic_entailment_implies_derivability_closed

def SoundnessCompletenessClosed {D : AbstractDeductiveSystem}
    {P : ProofCalculus D} {DP : DerivabilityPackage P}
    (SC : SoundnessCompletenessPackage DP) : Prop :=
  SC.syntactic_consistency_implies_semantic_closed ∧ SC.semantic_entailment_implies_derivability_closed

theorem soundness_completeness_closed_from_evidence {D : AbstractDeductiveSystem}
    {P : ProofCalculus D} {DP : DerivabilityPackage P}
    (SC : SoundnessCompletenessPackage DP)
    (E : SoundnessCompletenessEvidence SC) : SoundnessCompletenessClosed SC := by
  exact And.intro E.syntactic_consistency_semantic_closed E.semantic_entailment_derivability_closed

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse