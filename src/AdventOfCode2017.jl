VERSION >= v"1.0.0" && __precompile__(true)

module AdventOfCode2017

using DelimitedFiles
using LinearAlgebra
using Base.Meta

files = [x for x in readdir(joinpath(@__DIR__, "puzzles")) if splitext(x)[2]==".jl"]
include.(joinpath.(@__DIR__, "puzzles/", files))
for file in first.(splitext.(files))
    func = Symbol(file)
    @eval export $func
end

end
