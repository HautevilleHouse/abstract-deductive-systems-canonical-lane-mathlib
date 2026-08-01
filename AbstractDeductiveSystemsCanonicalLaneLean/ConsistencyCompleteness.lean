import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.Derivation

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure ConsistencyCompletenessPackage {A : AxiomSystemPackage} {D : DerivationPackage A} where
  consistent : Prop
  complete : Prop
  sound : consistent → Prop
  finitelyAxiomatizable : Prop

structure ConsistencyCompletenessEvidence {A : AxiomSystemPackage} {D : DerivationPackage A}
    (C : ConsistencyCompletenessPackage A D) where
  consistentClosed : C.consistent
  completeClosed : C.complete
  soundClosed : C.sound C.consistent
  finitelyAxiomatizableClosed : C.finitelyAxiomatizable

def ConsistencyCompletenessClosed {A : AxiomSystemPackage} {D : DerivationPackage A}
    (C : ConsistencyCompletenessPackage A D) : Prop :=
  C.consistent ∧ C.complete ∧ C.sound C.consistent ∧ C.finitelyAxiomatizable

theorem consistency_completeness_closed_from_evidence {A : AxiomSystemPackage} {D : DerivationPackage A}
    (C : ConsistencyCompletenessPackage A D) (E : ConsistencyCompletenessEvidence C) :
    ConsistencyCompletenessClosed C := by
  exact And.intro E.consistentClosed (And.intro E.completeClosed (And.intro E.soundClosed E.finitelyAxiomatizableClosed))

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse