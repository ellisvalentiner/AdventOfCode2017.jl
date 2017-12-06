
function _findcycleindex(a::Array)
    n = size(a, 1)
    lastrow = a[n, :]
    for row in collect((n-1):-1:2)
        if lastrow == a[row, :]
            return n - row
        end
    end
end

function puzzle06(path::String=joinpath(@__DIR__, "..", "data/06.txt"))
    data = readdlm(path, Int)
    n = size(data, 2)
    configurations = zeros(Int, (size(data)))
    notfound = true
    while notfound
        val, pos = findmax(data)

        data[pos] = 0
        for offset in 1:val
            i = offset + pos
            r = rem(i, n)
            i = r==0 ? n: r
            data[i] += 1
        end

        for row = 1:size(configurations, 1)
            if data[1,:] == configurations[row,:]
                notfound = false
                break
            end
        end
        configurations = vcat(configurations, data)
    end
    partone = size(configurations, 1) - 1
    parttwo = _findcycleindex(configurations)

    return [partone, parttwo]
end
