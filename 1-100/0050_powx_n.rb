# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
    return 1 if n == 0

    if n < 0
        x = 1.0/x
        n = n.abs
    end
    
    return x if n == 1

    half = my_pow(x, n/2)
    n % 2 == 1 ? half*half*x : half*half
end
