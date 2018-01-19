
import Base.Iterators.Flatten

function puzzle19(path::String=joinpath(@__DIR__, "..", "data/20.txt"))
    path = "src/data/20.txt"
    data = map(x->parse.(x), matchall.(r"-?[0-9]+", readlines(path)))
    iter = 0
    closest = []
    while true
        distance = []
        for particle in data
            # Increase velocity by the acceleration
            particle[4:6] = particle[4:6] + particle[7:9]
            # Increase the position by the velocity
            particle[1:3] = particle[1:3] + particle[4:6]
            # Calculate distance
            append!(distance, sum(abs.(particle[1:3])))
        end
        append!(closest, indmin(distance))
        iter += 1
        if iter > 1_000
            if closest[iter] == closest[iter-1]
                break
            end
        end
    end
    partone = last(closest)-1
    return [partone, parttwo]
end
