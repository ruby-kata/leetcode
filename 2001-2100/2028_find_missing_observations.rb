# @param {Integer[]} rolls
# @param {Integer} mean
# @param {Integer} n
# @return {Integer[]}
def missing_rolls(rolls, mean, n)
    size = rolls.size + n
    sum = mean * size - rolls.sum
    return [] if sum > 6 * n || sum < n

    r = sum % n
    d = sum / n
    [d] * (n - r) + [d + 1] * r
end
