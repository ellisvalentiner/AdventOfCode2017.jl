#' # AdventOfCode2017
#'
#' [![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)
#'
#' [![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)
#'
#' [![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

using AdventOfCode2017

for puzzle in filter(x->x≠:AdventOfCode2017, names(AdventOfCode2017, false))
    @eval begin
        print("$($puzzle):")
        @time $puzzle
    end
end
