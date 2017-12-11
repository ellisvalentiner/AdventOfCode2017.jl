
x = Dict(
    "n"  => [0, 1, -1],
    "ne" => [1, 0, -1],
    "se" => [1, -1, 0],
    "s"  => [0, -1, 1],
    "sw" => [-1, 0, 1],
    "nw" => [-1, 1, 0]
)

cube_distance(a::Array{Int64,1}) = Int(sum(abs.(a))/2)

function puzzle11(path::String=joinpath(@__DIR__, "..", "data/11.txt"))
    instructions = readdlm(path, ',')
    location = zeros(Int, 3)

    furthest_distance = 0
    for step in instructions
        location += x[step]
        furthest_distance = max(furthest_distance, cube_distance(location))
    end

    return [cube_distance(location), furthest_distance]

end
