import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure AxiomSystemPackage where
  language : Type u
  formulas : Type v
  axioms : formulas → Prop
  inferenceRules : Type w
  ruleApplication : inferenceRules → (List formulas) → formulas → Prop
  finiteRuleNumber : Prop
  decidableAxioms : Prop

structure AxiomSystemEvidence (A : AxiomSystemPackage) where
  finiteRuleNumberClosed : A.finiteRuleNumber
  decidableAxiomsClosed : A.decidableAxioms

def AxiomSystemClosed (A : AxiomSystemPackage) : Prop :=
  A.finiteRuleNumber ∧ A.decidableAxioms

theorem axiom_system_closed_from_evidence (A : AxiomSystemPackage) (E : AxiomSystemEvidence A) :
    AxiomSystemClosed A := by
  exact And.intro E.finiteRuleNumberClosed E.decidableAxiomsClosed

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse