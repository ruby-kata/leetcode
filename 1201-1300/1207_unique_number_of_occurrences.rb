# @param {Integer[]} arr
# @return {Boolean}
def unique_occurrences(arr)
    occurrences = {}
    !!(arr.tally.each do |_, count|
        break false if occurrences.has_key?(count)
        occurrences[count] = true
    end)
end
