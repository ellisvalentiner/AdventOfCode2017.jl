VERSION >= v"0.6.0" && __precompile__(true)

module AdventOfCode2017

root = Pkg.dir("AdventOfCode2017")
files = [x for x in readdir(joinpath(root, "src/puzzles")) if splitext(x)[2]==".jl"]
include.(joinpath.("puzzles/", files))
for file in first.(splitext.(files))
    func = Symbol(file)
    @eval export $func
end

end
