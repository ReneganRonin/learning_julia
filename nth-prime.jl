function is_prime(v)
    if 1 >= v <= 0
        return false
    end
    if v == 2
        return true
    end
    for i in range(2, step=1, stop=v - 1)
        if v % i == 0
            return false
        end
    end
    return true
end

# for test in range(-2, step=1, stop=100)
#     is_it = is_prime(test)
#     println("$test is prime? $is_it")
# end

function nth_prime(n)
    prime = 2
    num = 3
    if n == 1
        return prime
    end
    if n > 1
        while prime < n
            num += 2
            if is_prime(num)
                prime += 1
            end
        end
        return num
    end
end


nth = nth_prime(10_001)
println("What is the 0-indexed $nth", "th prime number?")
println("10_000 -> $nth")
