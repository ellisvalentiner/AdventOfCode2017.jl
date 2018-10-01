
import Base.Iterators: flatten

function puzzle07(path::String=joinpath(@__DIR__, "..", "data/07.txt"))
    input = readlines(path)
    programnames = []
    weights = []
    for line in input
        append!(programnames, [[m.match for m in eachmatch(r"[a-zA-Z]+", line)]])
        for m in eachmatch(r"[0-9]+", line)
            w = parse(Int, m.match)
            append!(weights, [w])
        end
    end
    weights = [first.(programnames) weights]

    graph = Array{Any}
    for i in 1:size(programnames, 1)
        program = programnames[i]
        parent = first(program)
        children = String.(program[1:end .!= 1])
        for child in children
            weight = weights[weights[:,1] .== child, 2]
            graph = vcat(graph, [parent child weight])
        end
    end

    for item in graph[:, 1]
        if !in(item, graph[:, 2])
            global partone
            partone = item
            break
        end
    end

    # Walk the tree
    parent = partone
    children = graph[graph[:,1] .== parent, 2]

    return [partone, nothing]
end

function walktree(node)
    children = graph[graph[:,1] .== node, 2]
    if size(x, 1) == 0
        weight = first(graph[graph[:, 2] .== node, 3])
        return weight
    else
        weights = walktree.(children)
        return sum(weights)
    end
end
