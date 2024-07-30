# @param {Integer[]} arr
# @param {Integer} m
# @param {Integer} k
# @return {Boolean}
def contains_pattern(arr, m, k)
    (0..arr.length-m).each { |i|
        pattern = arr[i...i+m]
        return true if (k-1).times.all? { |j|
            pattern == arr[(i + (j+1)*m)...(i + (j+2)*m)]
        }
    }
    false
end
