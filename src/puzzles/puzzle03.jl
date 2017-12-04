
function nextcoord(coord, maxsteps)
    x, y = coord
    if x==y
        x += 1
    elseif
        y += 1
    else
        x
    end
end

function adjacentcoords(coords)
    coords
end

location = (0, 0, 1)


function puzzle03(x::Int=325489)
    L = iseven(Int(ceil(√x))) ? ceil(√x)  + 1 : ceil(√x)
    corners = L^2 - (0:3)*(L-1)
    width = floor(L/2)
    height = minimum(abs.((x+width)-corners))
    partone = Int(height + width)

    # initialize matrix
    # (x, y, v)
    coords = [(0, 0, 1)]
    direction = ["right", "up", "left", "down"]
    steps = 1
    while true
        for s in 1:steps
            x, y, v = last(coords)
            println("Moving $(first(direction))")
            if first(direction) == "right"
                x += 1
            elseif first(direction) == "up"
                y += 1
            elseif first(direction) == "left"
                x -= 1
            elseif first(direction) == "down"
                y -= 1
            end
            v += 1
            append!(coords, [(x, y, v)])
        end
        direction = circshift(direction, -1)
        if first(direction) in ["left", "right"]
            steps += 1
        end
        if steps > 4
            break
        end
    end

    return [partone, parttwo]
end
