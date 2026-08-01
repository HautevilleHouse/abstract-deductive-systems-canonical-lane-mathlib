import AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus
import AbstractDeductiveSystemsCanonicalLaneLean.SemanticModel

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let L := A.object.language
  let D := mkDeductiveSystemFromObject A.object
  ∀ (f : Formula L), provable L D f → valid L f

def gateClosed (A : AdmissibleClass) : Prop :=
  A.consistent ∨ A.complete

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  intro f h
  -- Soundness of the deductive system gives exactly the bridge property.
  exact soundness (L := A.object.language) (D := mkDeductiveSystemFromObject A.object) (f := f) h

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.witness

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse