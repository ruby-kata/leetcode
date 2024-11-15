# 2 pointers
# O(n)
# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
    # non-decreasing prefix
    prefix_index = 0
    prefix_index += 1 while prefix_index < arr.size-1 && arr[prefix_index] <= arr[prefix_index+1]

    # non-descreaing suffix
    suffix_index = arr.size - 1
    suffix_index -= 1 while suffix_index > 0 && arr[suffix_index-1] <= arr[suffix_index]

    # the first 2 choices: keep prefix or keep suffix
    shortest = [arr.size - 1 - prefix_index, suffix_index].min

    # remove middle sub-array
    l = prefix_index
    r = arr.size - 1
    while r >= suffix_index && l >= 0 && r > l
        if arr[l] <= arr[r]
            r -= 1
        else
            l -= 1
        end
        shortest = [shortest, r - l].min
    end

    shortest
end
