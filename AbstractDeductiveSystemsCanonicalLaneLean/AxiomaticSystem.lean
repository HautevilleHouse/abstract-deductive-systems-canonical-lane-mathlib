import AbstractDeductiveSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure AxiomaticSystem where
  axioms : List Prop
  inferenceRules : List (List Prop → Prop)
  isConsistent : Prop
  isComplete : Prop

structure AxiomaticSystemEvidence (S : AxiomaticSystem) where
  axiomsGiven : S.axioms ≠ []
  inferenceRulesValid : ∀ (rule : List Prop → Prop), rule ∈ S.inferenceRules → (∀ (premises : List Prop), (∀ p ∈ premises, p) → rule premises)
  consistencyChecked : S.isConsistent
  completenessChecked : S.isComplete

def AxiomaticSystemClosed (S : AxiomaticSystem) : Prop :=
  S.axioms ≠ [] ∧ S.isConsistent ∧ S.isComplete

theorem axiomatic_system_closed_from_evidence (S : AxiomaticSystem) (E : AxiomaticSystemEvidence S) :
    AxiomaticSystemClosed S := by
  exact And.intro E.axiomsGiven (And.intro E.consistencyChecked E.completenessChecked)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse
