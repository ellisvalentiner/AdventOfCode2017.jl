
arrayrange(a, dims) = maximum(a, dims) - minimum(a, dims)

function puzzle02(path::String=joinpath(@__DIR__, "..", "data/02.txt"))
    x = readdlm(path, Int)
    partone = arrayrange(x, 2) |> sum

    parttwo = 0
    for i in 1:size(x, 1)
        y = x[i,:] ./ transpose(x[i,:])
        y[diagind(y)] = -.1
        parttwo += y[find(isinteger.(y))]
    end

    return [partone, Int(parttwo[1])]
end
