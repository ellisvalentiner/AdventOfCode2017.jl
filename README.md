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



<div class="markdown"><table><tr><th>Day</th><th>Elapsed &#40;s&#41;</th><th>Allocated &#40;bytes&#41;</th><th>Garbage Collection &#40;s&#41;</th></tr><tr><td>1</td><td>0.867567103</td><td>17516261</td><td>0.0</td></tr><tr><td>2</td><td>2.86301258</td><td>50228348</td><td>0.019407258</td></tr><tr><td>3</td><td>0.498929172</td><td>13195177</td><td>0.008656046</td></tr><tr><td>4</td><td>0.528930819</td><td>17934552</td><td>0.0</td></tr><tr><td>5</td><td>0.234561609</td><td>3929479</td><td>0.008399224</td></tr><tr><td>6</td><td>0.177288435</td><td>7678772</td><td>0.0</td></tr><tr><td>8</td><td>1.027152597</td><td>23257185</td><td>0.009987306</td></tr><tr><td>9</td><td>0.105061079</td><td>635426</td><td>0.0</td></tr><tr><td>10</td><td>0.151247505</td><td>2523171</td><td>0.0</td></tr><tr><td>11</td><td>3.031854148</td><td>129952499</td><td>0.036046839</td></tr><tr><td>**Median**</td><td>0.5139299955000001</td><td>1.5355719e7</td><td>0.004199612</td></tr><tr><td>**Total**</td><td>9.9995350425</td><td>2.82206589e8</td><td>0.086696285</td></tr></table>
</div>
