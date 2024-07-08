# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_div_by_k(nums, k)
    count = 0
    mod_k_counter = Hash.new(0)
    mod_k_counter[0] = 1
    sum = 0
    nums.each do |num|
        sum += num
        mod = sum % k
        count += mod_k_counter[mod]
        mod_k_counter[mod] += 1
    end

    count
end
