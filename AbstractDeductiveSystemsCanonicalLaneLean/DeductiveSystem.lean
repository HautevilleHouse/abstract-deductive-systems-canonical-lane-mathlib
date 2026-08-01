import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure AbstractDeductiveSystem where
  formulas : Type u
  deducible : formulas -> Prop
  deducible_closed_under_modus_ponens : Prop
  deducible_contains_tautologies : Prop
  consistency : Prop

structure DeductiveSystemEvidence (D : AbstractDeductiveSystem) where
  modus_ponens_closed : D.deducible_closed_under_modus_ponens
  tautologies_closed : D.deducible_contains_tautologies
  consistency_closed : D.consistency

def DeductiveSystemClosed (D : AbstractDeductiveSystem) : Prop :=
  D.deducible_closed_under_modus_ponens ∧ D.deducible_contains_tautologies ∧ D.consistency

theorem deductive_system_closed_from_evidence (D : AbstractDeductiveSystem)
    (E : DeductiveSystemEvidence D) : DeductiveSystemClosed D := by
  exact And.intro E.modus_ponens_closed (And.intro E.tautologies_closed E.consistency_closed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse