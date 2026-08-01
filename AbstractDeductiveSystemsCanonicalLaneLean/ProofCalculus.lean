import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystem

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure ProofCalculus (D : AbstractDeductiveSystem) where
  axiom_schemas : List (D.formulas)
  inference_rules : List ((List D.formulas) × D.formulas)
  finite_proof_condition : Prop
  axiom_schemas_are_deducible : ∀ (a : D.formulas), a ∈ axiom_schemas → D.deducible a
  inference_rules_preserve_deducibility : ∀ (r : (List D.formulas) × D.formulas),
    (∀ p ∈ r.1, D.deducible p) → D.deducible r.2
  finite_proof_condition_closed : finite_proof_condition

structure ProofCalculusEvidence {D : AbstractDeductiveSystem} (P : ProofCalculus D) where
  axiom_schemas_deducible_closed : P.axiom_schemas_are_deducible
  inference_rules_deducibility_closed : P.inference_rules_preserve_deducibility
  finite_proof_closed : P.finite_proof_condition_closed

def ProofCalculusClosed {D : AbstractDeductiveSystem} (P : ProofCalculus D) : Prop :=
  P.axiom_schemas_are_deducible ∧ P.inference_rules_preserve_deducibility ∧ P.finite_proof_condition_closed

theorem proof_calculus_closed_from_evidence {D : AbstractDeductiveSystem}
    (P : ProofCalculus D) (E : ProofCalculusEvidence P) : ProofCalculusClosed P := by
  exact And.intro E.axiom_schemas_deducible_closed
    (And.intro E.inference_rules_deducibility_closed E.finite_proof_closed)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse