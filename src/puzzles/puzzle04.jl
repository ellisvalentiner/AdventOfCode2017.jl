
Base.sort(s::SubString{String}) = reduce(*, sort(split(s, "")))

function puzzle04(path::String=joinpath(@__DIR__, "..", "data/04.txt"))
    passphrases = readlines(path)
    partone = allunique.(split.(passphrases, " ")) |> sum
    parttwo = allunique.(map.(sort, split.(passphrases, " "))) |> sum
    return [partone, parttwo]
end
