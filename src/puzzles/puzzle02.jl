
arrayrange(a, dims) = maximum(a, dims) - minimum(a, dims)
removediag(m::Matrix) = (m[diagind(m)]=1e-05)
getintegers(m::Matrix) = m[find(isinteger.(m))]

function puzzle02(path::String=joinpath(@__DIR__, "..", "data/02.txt"))
    data = readdlm(path, Int)
    extremes = extrema(data, 2)
    partone = sum([last(x)-first(x) for x in extremes])

    y = [data[i,:] ./ data[i,:]' for i in 1:size(data, 2)]
    removediag.(y)
    parttwo = Int(sum(getintegers.(y))[1])

    return [partone, parttwo]
end
