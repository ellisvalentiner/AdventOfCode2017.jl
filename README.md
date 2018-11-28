# AdventOfCode2017

[![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)

[![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

[![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

<pre class="julia-error">
ERROR: MethodError: no method matching median&#40;::Array&#123;Any,2&#125;, ::Int64&#41;
Closest candidates are:
  median&#40;::AbstractArray; dims&#41; at /Users/osx/buildbot/slave/package_osx64/build/usr/share/julia/stdlib/v1.0/Statistics/src/Statistics.jl:750
  median&#40;::Any&#41; at /Users/osx/buildbot/slave/package_osx64/build/usr/share/julia/stdlib/v1.0/Statistics/src/Statistics.jl:736
</pre>


<pre class="julia-error">
ERROR: MethodError: objects of type Array&#123;Any,2&#125; are not callable
Use square brackets &#91;&#93; for indexing an Array.
</pre>




## Performance

````julia
print(performance)
````


| Day | Elapsed (s) | Allocated (MiB) | Garbage Collection (s) |
|:--- | -----------:| ---------------:| ----------------------:|
| 1   |       0.447 |         67.9359 |                 0.0226 |
| 2   |      2.0448 |        316.2278 |                 0.1145 |
| 3   |      0.5578 |          83.761 |                 0.0339 |
| 4   |      0.4492 |         54.3902 |                 0.0398 |
| 5   |      0.1862 |         15.4439 |                    0.0 |
| 6   |      0.4323 |         56.5901 |                 0.0686 |
| 7   |      1.5562 |        809.2776 |                 0.0753 |
| 8   |       0.825 |         49.4892 |                 0.0098 |
| 9   |      0.1595 |          6.4352 |                 0.0051 |
| 10  |      0.5426 |         92.2009 |                 0.0252 |
| 11  |      0.5585 |         78.2333 |                 0.0154 |
| 12  |      0.8162 |        150.2785 |                 0.0523 |
| 13  |     46.3753 |     133016.0169 |                 4.9562 |
| 14  |      1.4285 |        754.9897 |                 0.1238 |
| 15  |     11.4919 |      15110.7101 |                 1.4724 |
| 16  |      1.9052 |       1918.0764 |                 0.2517 |
| 17  |      0.5437 |         67.5974 |                 0.0068 |
| 18  |      0.2407 |         30.6026 |                 0.0033 |
| 19  |      0.3113 |         43.6193 |                 0.0119 |
| 20  |     18.8032 |       9722.6337 |                 0.6592 |

