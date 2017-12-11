# AdventOfCode2017

[![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)

[![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

[![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)


````julia
using AdventOfCode2017
using Base.Markdown
import Base.Markdown: MD, Table

table = ["Day" "Elapsed (s)" "Allocated (bytes)" "Garbage Collection (s)"]
for puzzle in filter(x->x≠:AdventOfCode2017, names(AdventOfCode2017, false))
    m = match(r"[0-9]+", String(puzzle))
    day = string(parse(Int, m.match))
    @eval begin
        val, t, bytes, gctime, memallocs = @timed $puzzle()
        row = [$day t bytes gctime]
        table = vcat(table, row)
    end
end
table = vcat(table, ["**Median**" median(table[2:end, 2:end], 1)])
table = vcat(table, ["**Total**" sum(table[2:end, 2:end], 1)])

MD(Table(Any[map(x->Any[x], table[i,:]) for i in 1:size(table,1)], Symbol[:r, :r, :r, :r]))
````



<div class="markdown"><table><tr><th>Day</th><th>Elapsed &#40;s&#41;</th><th>Allocated &#40;bytes&#41;</th><th>Garbage Collection &#40;s&#41;</th></tr><tr><td>1</td><td>0.788051036</td><td>17304421</td><td>0.008716064</td></tr><tr><td>2</td><td>2.760262371</td><td>50218460</td><td>0.018563418</td></tr><tr><td>3</td><td>0.526375468</td><td>13118313</td><td>0.010343026</td></tr><tr><td>4</td><td>0.502919179</td><td>17958264</td><td>0.0</td></tr><tr><td>5</td><td>0.241034313</td><td>3938791</td><td>0.0</td></tr><tr><td>6</td><td>0.205748191</td><td>7678820</td><td>0.010566574</td></tr><tr><td>8</td><td>1.077161145</td><td>23257953</td><td>0.009469696</td></tr><tr><td>9</td><td>0.106357503</td><td>635426</td><td>0.0</td></tr><tr><td>10</td><td>0.143202419</td><td>2522947</td><td>0.0</td></tr><tr><td>11</td><td>0.253982251</td><td>7831009</td><td>0.0</td></tr><tr><td>**Median**</td><td>0.37845071500000005</td><td>1.0474661e7</td><td>0.004358032</td></tr><tr><td>**Total**</td><td>6.983544590999999</td><td>1.54939065e8</td><td>0.06201681</td></tr></table>
</div>
