
function puzzle08(path::String=joinpath(@__DIR__, "..", "data/08.txt"))
    instructions = readlines(path)
    instructions = [replace(i, "inc" => "+=") for i in instructions]
    instructions = [replace(i, "dec" => "-=") for i in instructions]
    registers = unique(first.(split.(instructions, " ")))

    for register in registers
        r = Symbol(register)
        @eval $r = 0
    end

    highest = 0
    for instruction in instructions
        consequence, condition = Meta.parse.(String.(split(instruction, "if")))
        @eval $(condition) ? $(consequence) : nothing
        highest = max(highest, maximum(eval.(Meta.parse.(registers))))
    end

    partone = maximum(eval.(Meta.parse.(registers)))

    return [partone, highest]
end
