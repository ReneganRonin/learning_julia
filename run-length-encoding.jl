using IterTools

function encode(s)
    return rle_encode(group_str(s))
end


function decode(s)
    return rle_decode(group_str(s))
end


function rle_encode(group)
    result = []
    for sub in group
        length_of_sub = length(sub)
        letter = sub[1]
        if length_of_sub > 1
            new_string = "$length_of_sub$letter"
        else
            new_string = "$letter"
        end
        push!(result, new_string)
    end
    return join(result)
end


function rle_decode(group)
    splitter = locate_num_and_str(group)
    numbers, strings = splitter[2], splitter[1]
    result = ""
    for i = 1:length(numbers)
        letter = strings[i]
        num = numbers[i]
        p = letter^num
        result = string(result, p)
    end
    return result
end


function group_str(raw::String)
    l = []
    for i in groupby(x -> x[1], raw)
        push!(l, i)
    end
    return l
end

function locate_num_and_str(group)
    tmp_numbers = ""
    numbers = []
    strings = []
    for sub in group
        letter = string(sub[1])
        if tryparse(Int, letter) === nothing
            if tmp_numbers == ""
                push!(numbers, 1)
                push!(strings, letter)
                tmp_numbers = ""
            else
                push!(numbers, parse(Int, tmp_numbers))
                push!(strings, letter)
                tmp_numbers = ""
            end
        else
            tmp_numbers = string(tmp_numbers, letter)
        end
    end
    return strings, numbers
end

result = encode(readline())
println(result)
println(decode(result))