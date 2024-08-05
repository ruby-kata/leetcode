# @param {String[]} arr
# @param {Integer} k
# @return {String}
def kth_distinct(arr, k)
    counter = Hash.new(0)
    arr.each { |x| counter[x] += 1 }
    # hash in ruby keep the order of the input entries
    counter.entries.filter { |k, v| v == 1 }[k-1]&.first || ''
end
