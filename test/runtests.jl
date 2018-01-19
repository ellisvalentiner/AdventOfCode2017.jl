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
@test puzzle08() == [6343, 7184]
@test puzzle09() == [8337, 4330]
@test puzzle10() == [826, "d067d3f14d07e09c2e7308c3926605c4"]
@test puzzle11() == [707, 1490]
@test puzzle12() == [115, 221]
@test puzzle13() == [1580, 3943252]
@test puzzle14() == [8074, 1212]
@test puzzle15() == [609, 253]
@test puzzle16() == ["kgdchlfniambejop", "fjpmholcibdgeakn"]
@test puzzle17() == [417, 34334221]
@test puzzle18() == [9423, nothing]
@test puzzle19() == ["GINOWKYXH", 16636]
@test puzzle20() == [119, nothing]
