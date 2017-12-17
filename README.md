# AdventOfCode2017

[![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2017.jl)

[![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2017.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)

[![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2017.jl?branch=master)




## Performance


````julia
print(performance)
````


| Day        | Elapsed (s) | Allocated (MiB) | Garbage Collection (s) |
|:---------- | -----------:| ---------------:| ----------------------:|
| 1          |      0.7267 |         16.5148 |                 0.0096 |
| 2          |      2.5846 |         47.8876 |                  0.018 |
| 3          |      0.4414 |         12.5321 |                  0.009 |
| 4          |      0.4764 |         17.2053 |                 0.0085 |
| 5          |      0.2001 |          3.7774 |                    0.0 |
| 6          |      0.1778 |          7.3224 |                    0.0 |
| 7          |       0.998 |        145.5148 |                 0.0426 |
| 8          |      0.9864 |         22.0717 |                 0.0065 |
| 9          |      0.0892 |          0.6039 |                    0.0 |
| 10         |      0.4281 |         24.5981 |                 0.0066 |
| 11         |      0.3975 |         12.0335 |                  0.008 |
| 12         |      0.6805 |        140.8659 |                 0.0251 |
| 13         |     58.4277 |     143357.6898 |                 8.5029 |
| 14         |      2.8557 |           706.4 |                 0.1404 |
| 15         |     11.3087 |      15106.4749 |                   1.47 |
| 16         |     13.7748 |        723.7087 |                 0.1498 |
| **Median** |      0.7036 |         23.3349 |                 0.0093 |
| **Total**  |     95.2572 |     160368.5358 |                10.4063 |

