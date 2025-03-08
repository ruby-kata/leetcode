# @param {String} blocks
# @param {Integer} k
# @return {Integer}
def minimum_recolors(blocks, k)
    black_count = (0...k).count { |i| blocks[i] == "B" }
    min = k - black_count

    (k...blocks.size).each { |i|
        black_count += 1 if blocks[i] == "B"
        black_count -= 1 if blocks[i-k] == "B"
        min = [min, k - black_count].min
    }

    min
end
