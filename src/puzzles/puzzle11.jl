
struct Location
    northing::Int
    easting::Int
end

countall(a::Array) = mapreduce(x -> Dict(x => count(x .== a)), merge, unique(a))

function puzzle11(path::String=joinpath(@__DIR__, "..", "data/11.txt"))
    instructions = readdlm(path, ',')

    instructioncount = countall(instructions)
    location = Location(0, 0)

    return [nothing, nothing]

end
