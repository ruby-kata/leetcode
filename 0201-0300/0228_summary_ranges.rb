# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
    ranges = []
    return ranges if nums.empty?
    
    first_num = last_num = nums.shift
    nums.append(Float::INFINITY).each do |num|
        if last_num == num - 1
            last_num = num
            next
        end
        ranges.push((first_num == last_num) ? first_num.to_s : "#{first_num}->#{last_num}")
        first_num = last_num = num
    end
    ranges
end
