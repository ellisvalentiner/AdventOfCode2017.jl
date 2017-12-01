
Base.circshift(s::String, shift::Int) = reduce(*, circshift(split(s, ""), shift))
splitshift(s::String, shift::Int) = split(circshift(s, shift), "")

function puzzle01(path::String=joinpath(@__DIR__, "..", "data/01.txt"))
    input = readline(normpath(path))
    x = split(input, "")
    y = splitshift.(input, [1, Int(length(input)/2)])
    solution = sum.(map(_x->parse.(Int, x[x.==_x]), y))
    return solution
end
