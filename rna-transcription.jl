const DNA_TO_RNA_TRANSCRIPTION_ = Base.ImmutableDict("A" => "U", "G" => "C", "T" => "A", "C" => "G")
function to_rna(dna)
    if contains(dna, r"[^ACGT]+")
        throw(ErrorException("Invalid input."))
    else
        map(dna |> collect) do p
            return get(DNA_TO_RNA_TRANSCRIPTION_, p |> string, "")
        end
    end |> join
end
