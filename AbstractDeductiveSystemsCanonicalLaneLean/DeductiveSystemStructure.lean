import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DeductiveSystemPackage (A : AdmissibleClass) where
  languageDefined : Prop
  formulasClosedUnderRules : Prop
  inferenceRulesSound : Prop

structure DeductiveSystemEvidence {A : AdmissibleClass} (P : DeductiveSystemPackage A) where
  languageDefinedClosed : P.languageDefined
  formulasClosedUnderRulesClosed : P.formulasClosedUnderRules
  inferenceRulesSoundClosed : P.inferenceRulesSound

def DeductiveSystemClosed {A : AdmissibleClass} (P : DeductiveSystemPackage A) : Prop :=
  P.languageDefined ∧ P.formulasClosedUnderRules ∧ P.inferenceRulesSound

theorem deductive_system_closed_from_evidence {A : AdmissibleClass} (P : DeductiveSystemPackage A) (E : DeductiveSystemEvidence P) : DeductiveSystemClosed P :=
  And.intro E.languageDefinedClosed (And.intro E.formulasClosedUnderRulesClosed E.inferenceRulesSoundClosed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse