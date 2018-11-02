
function hex2binary(x::String)
    # reduce(*, bin.(parse.(Int, collect(x)), 4))
    reduce(*, string.(hex2bytes(x), base=2, pad=8))
end

function puzzle14(input::String="jzgqcdpd")
    input = "jzgqcdpd"
    m = Array{Any,2}(nothing, 128, 128);
    for p in 1:128
        bytes = Int.(collect("$input-$(p-1)"))
        append!(bytes, [17, 31, 73, 47, 23])
        list = knothash(bytes, iterations=64)
        sparsehash = reshape(list, 16, 16)
        densehash = [reduce(xor, sparsehash[:, i]) for i in 1:size(sparsehash, 2)]
        hashstring = reduce(*, lpad.(string.(densehash, base=16), 2, "0"))
        binarystring = hex2binary(hashstring)
        m[p, :] = parse.(Int, collect(binarystring))
    end
    partone = sum(m)

    ref = reshape(1:16384, 128, 128)'
    graph = Dict()
    for i in 1:16384
        if m[i] == 1
            # find coordinates
            coord = findall(ref .== i)
            for c in coord
                x, y = c[1], c[2]
                nb_coords = [[(_x+x, y) for _x=-1:2:1]; [(x, _x+y) for _x=-1:2:1]]
                nb_coords = filter(x -> (0 < x[1][1] < 129) & (0 < x[2][1] < 129), nb_coords)
                neighbors = [ref[x[1], x[2]] for x in collect.(flatten.(nb_coords))]
                # if neighbor is also 1, add to edge list
                graph[i] = [nb for nb in neighbors if m[nb]==1]
            end
        end
    end

    nodes = [first(keys(graph))]
    connected = nodes
    groups = Dict()

    while length(graph) > 0
        while true
            g = []
            for node in nodes
                append!(g, [get(graph, node, nothing)])
            end
            g = reduce(vcat, g)
            nodes = setdiff(g, connected)
            if length(nodes) == 0
                break
            else
                for n in nodes
                    append!(connected, n)
                end
            end
        end
        groups[first(connected)] = connected
        for connection in connected
            delete!(graph, connection)
        end
        length(graph) == 0 ? break : nothing
        nodes = [first(keys(graph))]
        connected = nodes
    end
    parttwo = length(groups)

    return [partone, parttwo]
end
