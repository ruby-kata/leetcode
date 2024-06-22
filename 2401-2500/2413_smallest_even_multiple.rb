# @param {Integer} n
# @return {Integer}
def smallest_even_multiple(n)
    n.even? ? n : n*2
end
