function _firewall(input, delay::Int=0)
    n = size(input, 1)
    totalseverity = 0
    caught = 0
    for i in 1:n
        depth = input[i, 1]
        scanrange = input[i, 2]

        x = vcat(collect(1:scanrange), collect((scanrange-1):-1:2))
        x = circshift(x, depth + delay)

        if first(x)==1
            caught += 1
            totalseverity += depth*scanrange
        end

    end
    return (totalseverity, caught)
end

function puzzle13(path::String=joinpath(@__DIR__, "..", "data/13.txt"))
    input = readdlm(path, ':', Int)
    delay = 0
    notfound = true
    partone = nothing
    parttwo = nothing

    while notfound
        totalseverity, caught = _firewall(input, delay)

        if caught == 0
            notfound = false
            parttwo = delay
        end

        if delay == 0
            partone = totalseverity[1]
        end

        delay += 1
    end

    return [partone, parttwo]
end
