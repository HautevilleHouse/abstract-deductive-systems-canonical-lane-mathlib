import AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystemSyntax

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure Model (L : DeductiveLanguage) where
  domain : Type u
  constantInterpretation : L.constantSymbols → domain
  functionInterpretation : (f : L.functionSymbols) → List domain → domain
  relationInterpretation : (R : L.relationSymbols) → List domain → Prop

define satisfies (M : Model L) (assignment : String → M.domain) : Formula L → Prop := by
  intro f
  induction f with
  | atom R args =>
    apply M.relationInterpretation R (args.map (fun t => evalTerm M assignment t))
  | not f ih =>
    exact ¬ ih
  | and f g ih_f ih_g =>
    exact ih_f ∧ ih_g
  | or f g ih_f ih_g =>
    exact ih_f ∨ ih_g
  | implies f g ih_f ih_g =>
    exact ih_f → ih_g
  | forall v f ih =>
    exact ∀ (x : M.domain), satisfies M (fun w => if w = v then x else assignment w) f
  | exists v f ih =>
    exact ∃ (x : M.domain), satisfies M (fun w => if w = v then x else assignment w) f

def valid (L : DeductiveLanguage) (f : Formula L) : Prop :=
  ∀ (M : Model L) (assignment : String → M.domain), satisfies M assignment f

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse