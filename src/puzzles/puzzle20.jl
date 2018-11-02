
function puzzle20(path::String=joinpath(@__DIR__, "..", "data/20.txt"))
    data = []
    for line in readlines(path)
        arr = []
        for m in eachmatch(r"-?[0-9]+", line)
            val = string(m.match)
            try
                val = parse(Int, val)
            catch
                val = Symbol(val)
            end
            append!(arr, val)
        end
        append!(data, [arr])
    end
    # data = map(x->parse.(x), matchall.(r"-?[0-9]+", readlines(path)))
    iter = 0
    closest = []
    collided = falses(length(data))
    positions = [x[1:3] for x in data]
    velocity = [x[4:6] for x in data]
    acceleration = [x[7:9] for x in data]
    while true
        # Positions are updated simultaneously
        velocity += acceleration
        positions += velocity
        distances = [sum(abs.(x)) for x in positions]
        append!(closest, findmin(distances)[2])
        iter += 1
        # Part 2: determine collisons
        # for each particle that has not yet collided
        # check that it does not match the position of any other particle
        # and that the other particle has not already been collided
        for i in findall(.!collided)
            # check if is collided with any other non collided
            for j in findall(.!collided)
                if i == j
                    continue
                elseif positions[i]==positions[j]
                    collided[i] = true
                    collided[j] = true
                end
            end
        end
        # Check if we should end the loop
        if iter > 1_000
            if closest[iter] == closest[iter-1]
                break
            end
        end
    end
    partone = last(closest)-1
    parttwo = sum(.!collided)
    return [partone, parttwo]
end
