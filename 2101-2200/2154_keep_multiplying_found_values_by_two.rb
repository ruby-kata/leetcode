# @param {Integer[]} nums
# @param {Integer} original
# @return {Integer}
def find_final_value(nums, original)
    divider_counter = {}
    nums.each do |num|
        divider_counter[num/original] = true if (num % original).zero? 
    end

    multiplier = 1
    multiplier *= 2 while divider_counter.has_key?(multiplier)

    original * multiplier
end
