# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer[]}
def kth_smallest_prime_fraction(arr, k)
    l = 0.0
    r = 1.0
    while l < r
        m = (l + r) / 2
        count_fraction_lessthan_or_equal_m = 0
        i = 0
        j = 1
        max_fraction_i = 0
        max_fraction_j = 1

        while i < arr.length
            j += 1 while j < arr.length && arr[i] > m * arr[j]
            break if j == arr.length

            count_fraction_lessthan_or_equal_m += arr.length - j
            if max_fraction_i * arr[j] < max_fraction_j * arr[i]
                max_fraction_i = arr[i]
                max_fraction_j = arr[j]
            end 
            i += 1
        end

        return [max_fraction_i, max_fraction_j] if count_fraction_lessthan_or_equal_m == k

        if count_fraction_lessthan_or_equal_m > k
            r = m
        else
            l = m
        end
    end
end
