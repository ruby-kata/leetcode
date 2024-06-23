# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
    prefix_mod_k = Hash.new
    prefix_mod_k[0] = true
    
    prev = 0
    curr = nums[0] 
    sum = 0
    (1...nums.length).each do |i|
        sum += prev
        prefix_mod_k[sum % k] = true
        prev = curr
        curr = nums[i]
        return true if prefix_mod_k.has_key?((sum + prev + curr) % k)
    end

    false
end
