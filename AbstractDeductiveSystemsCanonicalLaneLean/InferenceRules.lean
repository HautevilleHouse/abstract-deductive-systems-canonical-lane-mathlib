import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure InferencePackage {D : DeductiveSystemPackage} where
  ruleSet : Type u
  ruleSoundness : Prop
  ruleCompleteness : Prop
  ruleSetDefined : Prop
  soundnessClosed : Prop
  completenessClosed : Prop

structure InferenceEvidence {D : DeductiveSystemPackage} (I : InferencePackage D) where
  ruleSetDefinedClosed : I.ruleSetDefined
  soundnessClosedClosed : I.soundnessClosed
  completenessClosedClosed : I.completenessClosed

def InferenceClosed {D : DeductiveSystemPackage} (I : InferencePackage D) : Prop :=
  I.ruleSetDefined ∧ I.soundnessClosed ∧ I.completenessClosed

theorem inference_closed_from_evidence {D : DeductiveSystemPackage} (I : InferencePackage D) (E : InferenceEvidence I) :
    InferenceClosed I := by
  exact And.intro E.ruleSetDefinedClosed
    (And.intro E.soundnessClosedClosed E.completenessClosedClosed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse
