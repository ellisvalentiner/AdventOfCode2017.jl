
function puzzle21(path::String=joinpath(@__DIR__, "..", "data/21.txt"))
    path = "src/data/21.txt"
    puzzle_input = readlines(path);
    # pattern = ['.' '#' '.'; '.' '.' '#'; '#' '#' '#'];
    pattern = ".#./..#/###";
    enhancement_rules = Dict{String,String}();
    for line in puzzle_input
        k, v = split(line, " => ")
        enhancement_rules[String(k)] = String(v)
    end
    count = 1
    while count < 5
        try
            pattern = enhancement_rules[pattern]
            count += 1
        catch
            1
        end
    end
end
