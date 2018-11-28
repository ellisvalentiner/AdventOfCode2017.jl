#' # AdventOfCode2017
#'
#' [![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)
#'
#' [![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)
#'
#' [![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

#+ echo=false
using AdventOfCode2017
using Markdown
import Markdown: MD, Table
import Statistics: median

table = ["Day" "Elapsed (s)" "Allocated (MiB)" "Garbage Collection (s)"]
for puzzle in filter(x-> x≠ :AdventOfCode2017, names(AdventOfCode2017, false))
    m = match(r"[0-9]+", String(puzzle))
    day = string(parse(Int, m.match))
    @eval begin
        val, t, bytes, gctime, memallocs = @timed $puzzle()
        t = round(t, 4)
        kib = round(bytes/1024^2, 4)
        gctime = round(gctime, 4)
        row = [$day t kib gctime]
        table = vcat(table, row)
    end
end
table = vcat(table, ["**Median**" round.(median(table[2:end, 2:end], 1), 4)])
table = vcat(table, ["**Total**" round.(sum(table[2:end, 2:end], 1), 4)])
performance = MD(Table(Any[map(x->Any[x], table[i, :]) for i in 1:size(table, 1)], Symbol[:l, :r, :r, :r]))

#' ## Performance

#+ echo=false
#+ results="as_is"
print(performance)
