# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
    jewels_hash = jewels.chars.tally
    stones.chars.count { |s| jewels_hash.has_key?(s) }
end
