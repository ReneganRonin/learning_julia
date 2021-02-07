count_nucleotides(strand) = x -> rx = r"[^AGTC]+"
  if contains(strand, rx)
  throw(DomainError(strand, "argument must contain a DNA strand sequence"))
  end
  return Dict{Char, Int}(i => count(string(i), strand) for i in "AGTC") 

println(count_nucleutides("ASSF"))
