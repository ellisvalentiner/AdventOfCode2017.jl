
function knothash(lengths::Array{Int, 2}, list::UnitRange=0:255)
    n = length(lengths)
    pos = 0
    skip = 0

    for i in 1:n

        L = lengths[i]
        list = circshift(list, -pos)
        reverse!(list, 1, L)
        list = circshift(list, pos)
        pos += L + skip
        skip += 1

    end

    return list
end

function puzzle10(path::String=joinpath(@__DIR__, "..", "data/10.txt"))

    lengths = readdlm(path, ',', Int)
    list = knothash(lengths)
    partone = list[1] * list[2]

    return [partone, nothing]

end
