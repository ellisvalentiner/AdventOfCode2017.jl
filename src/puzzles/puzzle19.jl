
import Base.Iterators.Flatten

function puzzle19(path::String=joinpath(@__DIR__, "..", "data/19.txt"))
    data = readlines(path)
    n = length(data)
    m = Matrix(n, n)
    x = split.(data, "")
    for i in 1:n
        m[i, :] = x[i]
    end

    i = 1
    j = findn(m[1, :] .== "|")
    while true
        if m[i, j] == "+"
            if 1 < i < n
                
            elseif 1 < j < n

            end
        end
    end

    return [partone, parttwo]
end
