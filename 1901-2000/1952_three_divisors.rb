# @param {Integer} n
# @return {Boolean}
def is_three(n)
    x = 2
    while x * x <= n
        return x * x == n if n % x == 0
        x += 1
    end
    false
end
