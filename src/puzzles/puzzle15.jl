
check_match(a, b) = string(a, base=2, pad=32)[17:32] == string(b, base=2, pad=32)[17:32] ? 1 : 0

function puzzle15(astart::Int=883, bstart::Int=879)
    a = copy(astart)
    b = copy(bstart)

    matches = 0
    for iter in 1:40_000_000
        a = rem(a * 16807, 2147483647)
        b = rem(b * 48271, 2147483647)
        matches += check_match(a, b)
    end
    partone = matches

    a = copy(astart)
    b = copy(bstart)
    matches = 0
    for iter in 1:5_000_000
        while true
            a = rem(a * 16807, 2147483647)
            rem(a, 4) == 0 ? break : nothing
        end
        while true
            b = rem(b * 48271, 2147483647)
            rem(b, 8) == 0 ? break : nothing
        end
        matches += check_match(a, b)
    end
    parttwo = matches

    return [partone, parttwo]
end
