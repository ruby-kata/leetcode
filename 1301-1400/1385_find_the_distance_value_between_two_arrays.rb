# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer} d
# @return {Integer}
def find_the_distance_value(arr1, arr2, d)
    arr2.sort!
    arr1.size - arr1.count { |x|
        (i = arr2.bsearch_index { |y| y >= x - d }) && arr2[i] <= x + d
    }
end
