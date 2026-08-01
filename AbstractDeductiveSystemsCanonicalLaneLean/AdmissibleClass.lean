import AbstractDeductiveSystemsCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure AbstractDeductiveSystem where
  axioms : List String
  inferenceRules : List (List String × String)
  theorems : List String
  derivable : String → Prop
  soundness : ∀ (t : String), t ∈ theorems → derivable t
  completeness : ∀ (t : String), derivable t → t ∈ theorems

structure AdmissibleClass where
  system : AbstractDeductiveSystem
  closureProp : Prop
  remainderRecorded : Prop
  gateWitness : closureProp ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DeductiveWitnessClosed A.system ∧ (A.closureProp ∨ A.remainderRecorded)

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse