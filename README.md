# AdventOfCode2017

[![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)

[![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

[![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)


````julia
using AdventOfCode2017

for puzzle in filter(x->x≠:AdventOfCode2017, names(AdventOfCode2017, false))
    @eval begin
        print("$($puzzle):")
        @time $puzzle
    end
end
````


````
AdventOfCode2017.puzzle01:  0.000003 seconds (83 allocations: 6.092 KiB)
AdventOfCode2017.puzzle02:  0.000001 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle03:  0.000000 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle04:  0.000001 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle05:  0.000000 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle06:  0.000000 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle08:  0.000001 seconds (3 allocations: 144 bytes)
AdventOfCode2017.puzzle09:  0.000000 seconds (3 allocations: 144 bytes)
````


