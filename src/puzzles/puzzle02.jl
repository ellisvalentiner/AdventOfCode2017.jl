
arrayrange(a, dims) = maximum(a, dims) - minimum(a, dims)
removediag(m::Matrix) = (m[diagind(m)]=1e-05)
getintegers(m::Matrix) = m[find(isinteger.(m))]

function puzzle02(path::String=joinpath(@__DIR__, "..", "data/02.txt"))
    x = readdlm(path, Int)
    partone = arrayrange(x, 2) |> sum

    y = [x[i,:] ./ x[i,:]' for i in 1:size(x, 2)]
    removediag.(y)
    parttwo = Int(sum(getintegers.(y))[1])

    return [partone, parttwo]
end
