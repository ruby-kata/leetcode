# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
    return 0 if k.zero?
    
    count = 0
    product = 1
    i = j = 0
    while i < nums.size
        count += i-j+1 if (product *= nums[i]) < k
        until product < k || j >= i
            product /= nums[j]
            j += 1
            count += i-j+1 if product < k
        end

        i += 1
    end

    count
end
