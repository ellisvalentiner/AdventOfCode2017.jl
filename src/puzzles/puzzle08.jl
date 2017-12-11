
function puzzle08(path::String=joinpath(@__DIR__, "..", "data/08.txt"))
    instructions = readlines(path)
    instructions = replace.(instructions, "inc", "+=")
    instructions = replace.(instructions, "dec", "-=")
    registers = unique(first.(split.(instructions, " ")))

    for register in registers
        r = Symbol(register)
        @eval $r = 0
    end

    highest = 0
    for instruction in instructions
        condition = parse(split(instruction, "if")[2])
        consequence = parse(split(instruction, "if")[1])
        @eval $condition ? $consequence : nothing
        highest = max(highest, maximum(eval.(parse.(registers))))
    end

    partone = maximum(eval.(parse.(registers)))

    return [partone, highest]
end
