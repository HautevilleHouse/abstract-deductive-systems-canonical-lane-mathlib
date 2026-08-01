import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.DeductiveSystem
import HautevilleHouse.AbstractDeductiveSystemsCanonicalLaneLean.ProofCalculus

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure InterpolationPackage {D : AbstractDeductiveSystem} (P : ProofCalculus D) where
  interpolation_property : Prop
  interpolant_construction : Prop
  interpolation_property_closed : interpolation_property
  interpolant_construction_closed : interpolant_construction

structure InterpolationEvidence {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (IP : InterpolationPackage P) where
  property_closed : IP.interpolation_property_closed
  construction_closed : IP.interpolant_construction_closed

def InterpolationClosed {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (IP : InterpolationPackage P) : Prop :=
  IP.interpolation_property_closed ∧ IP.interpolant_construction_closed

theorem interpolation_closed_from_evidence {D : AbstractDeductiveSystem} {P : ProofCalculus D}
    (IP : InterpolationPackage P) (E : InterpolationEvidence IP) : InterpolationClosed IP := by
  exact And.intro E.property_closed E.construction_closed

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse