"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
  rx = r"[^ACGT]+"
  if contains(strand, rx)
    throw(DomainError(strand, "argument must contain a DNA strand sequence"))
  end
  return Dict{Char, Int}(i => count(string(i), strand) for i in "AGTC") 
end

