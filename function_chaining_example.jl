split_str_evenly(str) = [(str*'_')[i:i+1] for i in 1:2:length(str)]

sample1 = "abcdef"
sample2 = "abcdefg"

# Function Chaining in Julia be like

result1 = split_str_evenly(sample1) |> collect |> reverse
result2 = split_str_evenly(sample2) |> collect |> length

println(result1)
println(result2)

