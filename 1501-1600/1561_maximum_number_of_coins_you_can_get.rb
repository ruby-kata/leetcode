# @param {Integer[]} piles
# @return {Integer}
def max_coins(piles)
    piles.sort!
    (piles.size-2).step(piles.size/3, -2).reduce(0) { |acc, i| acc + piles[i] }
end
