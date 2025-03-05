# @param {Integer} n
# @return {Integer}
def colored_cells(n)
    # from top cell to the mid line
    # count = 1 + 3 + 5 + ... + (2n - 1) = n**2
    # the same as from bottom cell to the mid line
    # but the mid line is duplicate
    # so 2 * count - the-mid-line-count
    2 * n**2 - (2*n - 1)
end
