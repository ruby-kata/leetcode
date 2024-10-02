# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
    sorted = arr.map.with_index { |num, i| [num, i] }.sort
    rank = 1
    prev = sorted.first&.first
    ranks = []
    (0...arr.size).each { |i|
        num, index = sorted[i]
        rank += num > prev ? 1 : 0
        prev = num
        ranks[index] = rank
    }

    ranks
end

def array_rank_transform(arr)
    h = arr.uniq.sort.each_with_index.to_h
    arr.map { |x| h[x] + 1 }
end
