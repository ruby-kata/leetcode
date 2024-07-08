# @param {Integer[]} arr
# @return {Integer}
def peak_index_in_mountain_array(arr)
    l = 0
    r = arr.size-1
    while l <= r
        mid = (l + r) >> 1

        return r if mid == 0
        return l if mid == arr.size-1
        return mid if arr[mid] > arr[mid-1] && arr[mid] > arr[mid+1]
        
        if arr[mid] < arr[mid+1]
            l = mid + 1
        else
            r = mid - 1
        end
    end
end
