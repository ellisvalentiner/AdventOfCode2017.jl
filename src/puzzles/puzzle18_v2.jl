
function puzzle18(path::String=joinpath(@__DIR__, "..", "data/18.txt"))

    instructions = readlines(path)

    registers = Dict();
    [registers[x] = 0 for x in string.('a':'z')];

    played = [];
    idx = 1;
    while idx < length(instructions)
        command = instruction[1:3]
        x = instruction[5:5]
        y = instruction[7:end]
        idxoffset = 1
        if command == "snd"
            append!(played, registers[x])
        elseif command == "set"
            y = parse(y)
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] = y
        elseif command == "add"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] += y
        elseif command == "mul"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] *= y
        elseif command == "mod"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] = rem(registers[x], y)
        elseif command == "rcv"
            if registers[x] != 0
                registers[x] = last(played)
                break
            end
        elseif command == "jgz"
            typeof(parse(x)) == Int ? x = parse(x) : x = registers[x]
            if x > 0
                idxoffset = parse(instruction[7:end])
            end
        end
        idx += idxoffset
    end

    return [last(played), nothing]
end
