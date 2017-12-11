using AdventOfCode2017
if VERSION < v"0.7"
    using Base.Test
else
    using Test
end

@test puzzle01() == [1203, 1146]
@test puzzle02() == [32020, 236]
@test puzzle03() == [552, 330785]
@test puzzle04() == [386, 208]
@test puzzle05() == [360603, 25347697]
@test puzzle06() == [3156, 1610]
@test puzzle07() == ["cyrupz", nothing]
