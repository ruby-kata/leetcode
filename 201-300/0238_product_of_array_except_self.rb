# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    product = [nums[0]]
    (1...nums.size-1).each do |i|
        product[i] = product[i-1] * nums[i]
    end

    suffix = 1
    (nums.size-1).downto(1) do |j|
        product[j] = product[j-1] * suffix
        suffix = suffix * nums[j]
    end
    product[0] = suffix

    product
end
