
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
    j = findn(m[1, :] .== "|")[1]
    path = []
    found = []
    direction = "down"
    while true
        # Keep track of the path
        append!(path, [(i, j)])
        # Continue along the direction
        if ismatch(r"-|\||[A-Z]", m[i, j])
            # Keep track of the letters we find
            if ismatch(r"[A-Z]", m[i, j])
                append!(found, m[i, j])
            end
            if direction=="down"
                i += 1
            elseif direction=="up"
                i -= 1
            elseif direction=="right"
                j += 1
            elseif direction=="left"
                j -= 1
            else
                error("invalid direction")
            end
        # Change direction
        elseif m[i, j] == "+"
            # There are no + on the outside edge
            if in(direction, ["down", "up"])
                # check other directions
                if ismatch(r"-|\|", m[i, j + 1])
                    j += 1
                    direction = "right"
                elseif ismatch(r"-|\|", m[i, j - 1])
                    j -= 1
                    direction = "left"
                else
                    print("wtf")
                end
            elseif in(direction, ["right", "left"])
                # check other directions
                if ismatch(r"-|\|", m[i + 1, j])
                    i += 1
                    direction = "down"
                elseif ismatch(r"-|\|", m[i - 1, j])
                    i -= 1
                    direction = "up"
                else
                    print("wtf")
                end
            else
                error("couldn't change direction!")
            end
        else
            # Must be at the end
            break
        end
    end
    partone = reduce(*, string.(found))
    parttwo = length(path) - 1

    return [partone, parttwo]
end
