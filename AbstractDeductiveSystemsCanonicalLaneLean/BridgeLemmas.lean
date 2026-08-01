import AbstractDeductiveSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

def DeductiveWitnessClosed (D : AbstractDeductiveSystem) : Prop :=
  D.soundness ∧ D.completeness

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DeductiveWitnessClosed A.system

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.system.soundness ∧ A.system.completeness

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse