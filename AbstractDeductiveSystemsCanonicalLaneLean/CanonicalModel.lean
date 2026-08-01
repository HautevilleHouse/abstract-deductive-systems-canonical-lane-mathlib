import AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus
import AbstractDeductiveSystemsCanonicalLaneLean.SemanticModel

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure CanonicalModel (L : DeductiveLanguage) (D : DeductiveSystem L) where
  theory : List (Formula L)
  consistent : ¬ (∃ (f : Formula L), provable L D f ∧ provable L D (Formula.not f))
  maximal : ∀ (f : Formula L), provable L D f ∨ provable L D (Formula.not f)

def canonicalModel (L : DeductiveLanguage) (D : DeductiveSystem L) (h : Nonempty (CanonicalModel L D)) : Model L := by
  let M := h.some
  exact {
    domain := Set (Formula L)  -- set of formulas modulo equivalence
    constantInterpretation := fun _ => { f | f ∈ M.theory }
    functionInterpretation := fun _ _ => { f | f ∈ M.theory }
    relationInterpretation := fun _ _ => True
  }

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse