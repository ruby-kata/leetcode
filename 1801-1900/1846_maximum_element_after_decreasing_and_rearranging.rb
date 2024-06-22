# @param {Integer[]} arr
# @return {Integer}
def maximum_element_after_decrementing_and_rearranging(arr)
    arr.sort!
    max = 0
    arr.each do |num|
        max = [max + 1, num].min
    end

    max
end
