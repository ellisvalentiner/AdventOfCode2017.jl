
snd(x::String) = append!(played, registers[x])
set(x::String, y::String) = registers[x] = registers[y]
set(x::String, y::Int) = registers[x] = y

function puzzle18(path::String=joinpath(@__DIR__, "..", "data/18.txt"))

    instructions = readlines(path)

    # Initialize registers...
    registers = Dict();
    [registers[x] = 0 for x in string.('a':'z')];

    played = [];
    idx = 1;
    while idx < length(instructions)
        # Parse instruction...
        instruction = instructions[idx]
        command = instruction[1:3]
        x = instruction[5:5]
        y = instruction[7:end]

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
            x = registers[x]
            registers[x] = rem(x, y)
            idx += 1
        elseif command == "rcv"
            if registers[x] != 0
                registers[x] = last(played)
                break
            end
            idx += 1
        elseif command == "jgz"
            if typeof(parse(x)) == Int
                x = parse(x)
            else
                x = registers[x]
            end
            if x > 0
                idx += parse(instruction[7:end])
            else
                idx += 1
            end
        end
        idx += 1
    end

    return [last(played), nothing]
end
