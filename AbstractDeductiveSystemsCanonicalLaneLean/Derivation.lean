import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.AxiomSystem

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DerivationPackage {A : AxiomSystemPackage} where
  derivationTree : Type u
  root : formulas
  leaves : List formulas
  step : inferenceRules → formulas → formulas → Prop
  finiteDepth : Prop
  soundnessProperty : Prop

structure DerivationEvidence {A : AxiomSystemPackage} (D : DerivationPackage A) where
  finiteDepthClosed : D.finiteDepth
  soundnessPropertyClosed : D.soundnessProperty

def DerivationClosed {A : AxiomSystemPackage} (D : DerivationPackage A) : Prop :=
  D.finiteDepth ∧ D.soundnessProperty

theorem derivation_closed_from_evidence {A : AxiomSystemPackage} (D : DerivationPackage A) (E : DerivationEvidence D) :
    DerivationClosed D := by
  exact And.intro E.finiteDepthClosed E.soundnessPropertyClosed

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse