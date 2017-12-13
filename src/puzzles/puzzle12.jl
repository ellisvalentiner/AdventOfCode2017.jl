
import Base.Iterators: flatten

function _parseline(s::String)
    x = split(s, " <-> ")
    node = parse(Int, first(x))
    connected = parse.(Int, String.(split(x[2], ", ")))
    return Dict(node => connected)
end

function puzzle12(path::String=joinpath(@__DIR__, "..", "data/12.txt"))
    input = readlines(path)
    graph = reduce(merge, _parseline.(input))

    # start with 0
    nodes = [0]
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

    partone = length(groups[0])
    parttwo = length(groups)

    return [partone, parttwo]
end
