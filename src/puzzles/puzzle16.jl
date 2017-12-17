
import Base.Iterators: flatten

function puzzle16(path::String=joinpath(@__DIR__, "..", "data/16.txt"))
    dancesequence = readline(path) |> x -> split(x,",")
    programs = collect('a':'p') |> x -> string.(x)
    listoforders = []
    for iter = 1:1_000_000_000
        for step in dancesequence
            if ismatch(r"s[0-9]+", step)
                spin = parse(match(r"[0-9]+", step).match)
                programs = circshift(programs, spin)
            elseif ismatch(r"x[0-9]+/[0-9]+", step)
                i, j = parse.(matchall(r"[0-9]+", step[2:end])) .+ 1
                programs[[j i]] = programs[[i j]]
            elseif ismatch(r"p[a-p]/[a-p]", step)
                x = split.(matchall(r"[a-p]/[a-p]", step[2:end]), "/")
                i, j = findin(programs, collect(flatten(x)))
                programs[[j i]] = programs[[i j]]
            else
                warn("step did not match")
            end
        end
        if reduce(*, programs) in listoforders
            break
        end
        listoforders = append!(listoforders, [reduce(*, programs)])
    end
    partone = listoforders[1]
    parttwo = listoforders[Int(1e9 % length(listoforders))]

    return [partone, parttwo]
end
