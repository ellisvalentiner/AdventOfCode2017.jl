
function puzzle03(input::Int=325489)
    L = iseven(Int(ceil(√input))) ? ceil(√input)  + 1 : ceil(√input)
    corners = L^2 - (0:3)*(L-1)
    width = floor(L/2)
    height = minimum(abs.((input+width)-corners))
    partone = Int(height + width)

    # initialize matrix
    # (x, y, v)
    coords = [(0, 0, 1)]
    direction = ["right", "up", "left", "down"]
    steps = 1
    notfound = true
    while notfound
        for s in 1:steps
            x, y, v = last(coords)
            if first(direction) == "right"
                x += 1
            elseif first(direction) == "up"
                y += 1
            elseif first(direction) == "left"
                x -= 1
            elseif first(direction) == "down"
                y -= 1
            end
            neighbors = reshape([(x+xx,y+yy) for xx=-1:1, yy=-1:1], 9)
            v = sum([x[3] for x in coords if x[1:2] in neighbors])
            append!(coords, [(x, y, v)])
            if v > input
                notfound = false
                break
            end
        end
        direction = circshift(direction, -1)
        if first(direction) in ["left", "right"]
            steps += 1
        end
    end
    parttwo = last(coords)[3]

    return [partone, parttwo]
end
