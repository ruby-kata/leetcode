# @param {Integer[]} arr
# @return {Boolean}
def valid_mountain_array(arr)
    i = 1
    while i < arr.length
        return false if arr[i] == arr[i-1]
        break if arr[i] < arr[i-1]
        i += 1
    end

    return false if i == 1 or i >= arr.length

    while i < arr.length - 1
        i += 1
        return false if arr[i-1] <= arr[i]
    end

    true
end
