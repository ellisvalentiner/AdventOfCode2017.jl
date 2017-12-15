
function hex2binary(x::String)
    reduce(*, bin.(parse.(Int, collect(x)), 4))
end

function adjacentcoords(c::Tuple)
    x, y = c
    return [[(max(_x+x, 1), y) for _x=-1:2:1]; [(x, max(_x+y, 1)) for _x=-1:2:1]]
end

function puzzle14(input::String="jzgqcdpd")
    input = "jzgqcdpd"
    m = Matrix(128, 128);
    for p in 1:128
        bytes = string2bytes("$input-$(p-1)")
        append!(bytes, [17, 31, 73, 47, 23])
        list = knothash(bytes, iterations=64)
        sparsehash = reshape(list, 16, 16)
        densehash = [reduce(xor, sparsehash[:, i]) for i in 1:size(sparsehash, 2)]
        hashstring = reduce(*, hex.(densehash, 2))
        binarystring = hex2binary(hashstring)
        m[p, :] = parse.(split(binarystring, ""))
    end
    partone = sum(m)

    ref = reshape(1:16384, 128, 128)'
    graph = Dict()
    for i in 1:16384
        if m[i] == 1
            # find coordinates
            x, y, val = findnz(ref .== i)
            nb_coords = [[(_x+x, y) for _x=-1:2:1]; [(x, _x+y) for _x=-1:2:1]]
            nb_coords = filter(x -> (0 < x[1][1] < 129) & (0 < x[2][1] < 129), nb_coords)
            neighbors = [ref[x[1], x[2]] for x in collect.(flatten.(nb_coords))]
            # if neighbor is also 1, add to edge list
            graph[i] = [nb for nb in neighbors if m[nb]==1]
        end
    end

    nodes = [first(keys(graph))]
    connected = nodes
    groups = Dict()

    while length(graph) > 0
        while true
            nodes = setdiff(collect(flatten(get.(graph, nodes, nothing))), connected)
            length(nodes) == 0 ? break : append!(connected, nodes)
        end
        groups[first(connected)] = connected
        delete!.(graph, connected)
        length(graph) == 0 ? break : nothing
        nodes = [first(keys(graph))]
        connected = nodes
    end
    parttwo = length(groups)

    return [partone, parttwo]
end
