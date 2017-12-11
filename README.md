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
table = vcat(table, [md"**Median**" median(table[2:end, 2:end], 1)])
table = vcat(table, [md"**Total**" sum(table[2:end, 2:end], 1)])

MD(Table(Any[map(x->Any[x], table[i,:]) for i in 1:size(table, 1)], Symbol[:r, :r, :r, :r]))
````



<div class="markdown"><table><tr><th>Day</th><th>Elapsed &#40;s&#41;</th><th>Allocated &#40;bytes&#41;</th><th>Garbage Collection &#40;s&#41;</th></tr><tr><td>1</td><td>0.811871435</td><td>17516261</td><td>0.0</td></tr><tr><td>2</td><td>2.7603779</td><td>50227676</td><td>0.017684984</td></tr><tr><td>3</td><td>0.481702348</td><td>13326329</td><td>0.008799943</td></tr><tr><td>4</td><td>0.52551307</td><td>17935224</td><td>0.0</td></tr><tr><td>5</td><td>0.22867854</td><td>3929479</td><td>0.008498935</td></tr><tr><td>6</td><td>0.192150014</td><td>7678772</td><td>0.0</td></tr><tr><td>8</td><td>1.078182455</td><td>23257505</td><td>0.008098936</td></tr><tr><td>9</td><td>0.105449657</td><td>635426</td><td>0.0</td></tr><tr><td>10</td><td>0.152542752</td><td>2523171</td><td>0.0</td></tr><tr><td>11</td><td>0.472064124</td><td>22320868</td><td>0.008967266</td></tr><tr><td><div class="markdown"><p><strong>Median</strong></p>
</div></td><td>0.476883236</td><td>1.5421295e7</td><td>0.004049468</td></tr><tr><td><div class="markdown"><p><strong>Total</strong></p>
</div></td><td>7.285415531</td><td>1.74772006e8</td><td>0.056099532</td></tr></table>
</div>
