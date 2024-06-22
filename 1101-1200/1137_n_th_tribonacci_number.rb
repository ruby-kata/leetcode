# @param {Integer} n
# @return {Integer}
def tribonacci(n)
    return 0 if n.zero?
    return 1 if n == 1 || n == 2

    x0, x1, x2 = 0, 1, 1
    i = 2
    until i == n
        xi = x2 + x1 + x0
        x0 = x1
        x1 = x2
        x2 = xi
        i += 1
    end

    x2
end
