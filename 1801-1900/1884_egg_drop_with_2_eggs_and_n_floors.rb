# @param {Integer} n
# @return {Integer}
def two_egg_drop(n)
    # jump search multiple levels 
    # set the first optimal block size is x
    # then we have: x + (x-1) + ... + 1 = n
    # => x(x+1)/2 = n
    # => x**2 + x -2n = 0
    # => x = (-1 + Math.sqrt(1 + 8n))/2
    ((-1 + Math.sqrt(1 + 8*n))/2).ceil
end
