
import Base.Iterators: flatten

function ismatch(re::Regex, s::String)
    m = collect(eachmatch(re, s))
    return length(m) > 0
end

ismatch(re::Regex, s::SubString) = ismatch(re, String(s))

function puzzle16(path::String=joinpath(@__DIR__, "..", "data/16.txt"))
    dancesequence = readline(path) |> x -> split(x,",")
    programs = collect('a':'p') |> x -> string.(x)
    listoforders = []
    for iter = 1:1_000_000_000
        for step in dancesequence
            if ismatch(r"s[0-9]+", step)
                spin = parse(Int, String(match(r"[0-9]+", step).match))
                programs = circshift(programs, spin)
            elseif ismatch(r"x[0-9]+/[0-9]+", step)
                matches = [String(m.match) for m in collect(eachmatch(r"[0-9]+", step[2:end]))]
                i, j = parse.(Int, matches) .+ 1
                programs[[j i]] = programs[[i j]]
            elseif ismatch(r"p[a-p]/[a-p]", step)
                matches = [String(m.match) for m in collect(eachmatch(r"[a-p]/[a-p]", step[2:end]))]
                x = split.(matches, "/")
                i, j = [findall(programs .== val) for val in collect(flatten(x))]
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
