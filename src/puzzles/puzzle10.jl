
function knothash(arr::Array{Int, 1}, list::UnitRange=0:255; pos::Int=0, skip::Int=0, iterations::Int=1)
    n = length(arr)
    for iter in 1:iterations
        for i in 1:n

            L = arr[i]
            if L > length(list)
                continue
            end
            list = circshift(list, -pos)
            reverse!(list, 1, L)
            list = circshift(list, pos)
            pos += L + skip
            skip += 1

        end
    end

    return list
end

"Convert a string to bytes"
function string2bytes(s::String)
    Int.(collect(s))
end

function puzzle10(path::String=joinpath(@__DIR__, "..", "data/10.txt"))
    input = readline(path)
    lengths = parse.(Int, split(input, ","))
    list = knothash(lengths)
    partone = list[1] * list[2]

    stringofbytes = string2bytes(input)
    append!(stringofbytes, [17, 31, 73, 47, 23])
    list = knothash(stringofbytes, iterations=64)
    sparsehash = reshape(list, 16, 16)
    densehash = [reduce(xor, sparsehash[:, i]) for i in 1:size(sparsehash, 2)]
    parttwo = reduce(*, lpad.(string.(densehash, base=16), 2, "0"))

    return [partone, parttwo]

end
