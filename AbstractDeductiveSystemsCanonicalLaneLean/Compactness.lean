import AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus
import AbstractDeductiveSystemsCanonicalLaneLean.SemanticModel

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

theorem compactness (L : DeductiveLanguage) (D : DeductiveSystem L) (T : List (Formula L)) :
    (∀ (finiteSubset : List (Formula L)), finiteSubset ⊆ T → ∃ (M : Model L), ∀ (f : Formula L), f ∈ finiteSubset → satisfies M (fun _ => M.domain) f) →
    ∃ (M : Model L), ∀ (f : Formula L), f ∈ T → satisfies M (fun _ => M.domain) f := by
  intro h
  exact h T (by
    intro f hf
    exact hf)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse