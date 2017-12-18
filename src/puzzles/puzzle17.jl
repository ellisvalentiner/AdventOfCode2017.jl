
function puzzle17(input::Int=348)

    input=348
    arr = [0]
    for iter in 1:2017
        arr = circshift(arr, -input)
        insert!(arr, 2, iter)
        arr = circshift(arr, -1)
    end
    partone = arr[2]

    cur = 0
    val = 0
    for iter in 1:50_000_000
        cur = mod1(cur + input, iter)
        if cur == 1
            val = iter
        end
        cur += 1
    end
    parttwo = val

    return [partone, parttwo]
end
