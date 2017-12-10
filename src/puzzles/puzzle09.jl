
function puzzle09(path::String=joinpath(@__DIR__, "..", "data/09.txt"))
    stream = readline(path)

    idx = 1

    total = 0
    noncanceled = 0

    arr = []
    groups = 0
    isgarbage = false

    while idx <= length(stream)
        if stream[idx] == '!'
            idx += 1
        elseif isgarbage
            stream[idx] == '>' ? isgarbage = false : noncanceled += 1
        elseif stream[idx] == '{'
            groups += 1
            append!(arr, groups)
        elseif stream[idx] == '<'
            isgarbage = true
        elseif stream[idx] == '}'
            groups -= 1
            total += pop!(arr)
        end
        idx += 1
    end

    return [total, noncanceled]

end
