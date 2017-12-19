
function _f(a::String, offset::Int)
    x = split(a, "")
    y = circshift(x, offset)
    z = sum(parse.(Int, x[x .== y]))
    return z
end

function puzzle01(path::String=joinpath(@__DIR__, "..", "data/01.txt"))
    input = readline(path)
    solution = _f.(input, [1, Int(length(input)/2)])
    return solution
end
