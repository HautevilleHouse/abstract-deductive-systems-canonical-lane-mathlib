import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DeductiveSystemPackage where
  language : Type u
  axiomSet : Type v
  inferenceRules : Type w
  languageDefined : Prop
  axiomSetDefined : Prop
  inferenceRulesDefined : Prop
  consistencyCondition : Prop

structure DeductiveSystemEvidence (D : DeductiveSystemPackage) where
  languageDefinedClosed : D.languageDefined
  axiomSetDefinedClosed : D.axiomSetDefined
  inferenceRulesDefinedClosed : D.inferenceRulesDefined
  consistencyConditionClosed : D.consistencyCondition

def DeductiveSystemClosed (D : DeductiveSystemPackage) : Prop :=
  D.languageDefined ∧ D.axiomSetDefined ∧ D.inferenceRulesDefined ∧ D.consistencyCondition

theorem deductive_system_closed_from_evidence (D : DeductiveSystemPackage) (E : DeductiveSystemEvidence D) :
    DeductiveSystemClosed D := by
  exact And.intro E.languageDefinedClosed
    (And.intro E.axiomSetDefinedClosed
      (And.intro E.inferenceRulesDefinedClosed E.consistencyConditionClosed))

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse
