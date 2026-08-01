import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystem
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.Derivability
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.SoundnessCompleteness
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.Interpolation

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DeductiveSystemClosed (A.object : AbstractDeductiveSystem)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  exact A.closed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedDeductiveClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_deductive_endgame (A : AdmissibleClass) : ConstrainedDeductiveClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse