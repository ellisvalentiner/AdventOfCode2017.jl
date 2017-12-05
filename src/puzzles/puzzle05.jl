
function _f(a::Array, x::Function)
    s = copy(a)
    n = length(s)
    p = 1
    i = 0
    while p <= n
        i += 1
        value = s[p]
        s[p] = x(value)
        p += value
    end
    return i
end

function puzzle05(path::String=joinpath(@__DIR__, "..", "data/05.txt"))
    input = parse.(Int, readlines(path))
    solution = map(x->_f(input, x), [x -> x+1, x -> x + (x≥3 ? -1 : 1)])
    return solution
end
