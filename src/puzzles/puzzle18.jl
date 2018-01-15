
snd(x::String) = append!(played, registers[x])
set(x::String, y::String) = registers[x] = registers[y]
set(x::String, y::Int) = registers[x] = y
add(x::String, y::String) = registers[x] += registers[y]
add(x::String, y::Int) = registers[x] += y
mul(x::String, y::String) = registers[x] *= registers[y]
mul(x::String, y::Int) = registers[x] *= y
mod(x::String, y::String) = registers[x] = rem(registers[x], registers[y])
mod(x::String, y::Int) = registers[x] = rem(registers[x], y)
rcv(x::String, y::String) = (registers[x] != 0) ? registers[x] = last(played) : nothing
# rcv(x::String, y::Int) =

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
            idx += 1
        elseif command == "set"
            y = parse(y)
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] = y
            idx += 1
        elseif command == "add"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] += y
            idx += 1
        elseif command == "mul"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] *= y
            idx += 1
        elseif command == "mod"
            y = parse(instruction[7:end])
            if typeof(y) == Symbol
                y = registers[string(y)]
            end
            registers[x] = rem(registers[x], y)
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
    end

    return [last(played), nothing]
end
