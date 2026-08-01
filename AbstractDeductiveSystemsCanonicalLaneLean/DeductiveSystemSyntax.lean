import AbstractDeductiveSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbstractDeductiveSystemsCanonicalLaneLean

structure DeductiveLanguage where
  constantSymbols : Type u
  functionSymbols : Type v
  relationSymbols : Type w

inductive Formula (L : DeductiveLanguage) : Type _ where
  | atom (R : L.relationSymbols) (args : List (Term L)) : Formula L
  | not (f : Formula L) : Formula L
  | and (f g : Formula L) : Formula L
  | or (f g : Formula L) : Formula L
  | implies (f g : Formula L) : Formula L
  | forall (v : String) (f : Formula L) : Formula L
  | exists (v : String) (f : Formula L) : Formula L

inductive Term (L : DeductiveLanguage) : Type _ where
  | var (s : String) : Term L
  | const (c : L.constantSymbols) : Term L
  | func (f : L.functionSymbols) (args : List (Term L)) : Term L

end AbstractDeductiveSystemsCanonicalLaneLean
end HautevilleHouse