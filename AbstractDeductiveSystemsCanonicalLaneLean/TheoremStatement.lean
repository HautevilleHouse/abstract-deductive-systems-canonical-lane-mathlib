import AbstractDeductiveSystemsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DeductiveTheoremStatement where
  systemName : String
  claim : String
  boundaryOpen : Bool

def sourceDeductiveTheorem : DeductiveTheoremStatement :=
  { systemName := "AbstractDeductiveSystems",
    claim := "Every admissible abstract deductive system is bridge-closed and gate-closed",
    boundaryOpen := true
  }

theorem theorem_statement_asserted :
    sourceDeductiveTheorem.claim = "Every admissible abstract deductive system is bridge-closed and gate-closed" := by
  rfl

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse