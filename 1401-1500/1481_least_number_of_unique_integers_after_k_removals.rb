# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
    freq = arr.tally.to_a.sort_by(&:last)

    freq.each_with_index do |(num, count), i|
        if k >= count
            k -= count
        else
            return freq.size - i
        end
    end

    0
end
