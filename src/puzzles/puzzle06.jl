
function puzzle06(path::String=joinpath(@__DIR__, "..", "data/06.txt"))
    data = readdlm(path, Int)
    n = size(data, 2)
    configurations = Dict()
    notfound = true
    iter = 1

    while notfound
        val, pos = findmax(data)

        data[pos] = 0
        for offset in 1:val
            i = offset + pos
            r = rem(i, n)
            i = r==0 ? n: r
            data[i] += 1
        end

        dhash = hash(data)

        if haskey(configurations, dhash)
            notfound = false
            partone = iter
            parttwo = iter - configurations[dhash]
            return [partone, parttwo]
        end

        configurations[dhash] = iter
        iter += 1

    end

end
