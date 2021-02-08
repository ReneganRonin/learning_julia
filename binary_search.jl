function binary_search(list, item)
    low = 1
    high = list[end]
    while low <= high
        mid = (low + high) / 2
        guess = list[trunc(Int, mid)]
        if guess == item
            return trunc(Int, mid)
        end
        if guess > item
            high = mid -1
        else
            low = mid + 1
        end
    end
    return nothing
end

test_list = 0:10000

println(binary_search(test_list, 4356))
println(binary_search(test_list, -1))
