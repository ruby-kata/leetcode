# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
    counter = Array.new(1001, 0)
    arr1.each { |num| counter[num] += 1 }
    arr2.concat((0..1000).to_a).map { |i| 
        ([i] * counter[i]).tap { counter[i] = 0 }
    }.flatten
end
