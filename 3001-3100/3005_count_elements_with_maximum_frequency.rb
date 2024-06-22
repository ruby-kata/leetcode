# @param {Integer[]} nums
# @return {Integer}
def max_frequency_elements(nums)
    counter = Hash.new(0)
    max_freq = 0
    total_max = 0
    nums.each do |num|
        counter[num] += 1

        if counter[num] == max_freq
            total_max += counter[num]
        elsif counter[num] > max_freq
            max_freq = counter[num]
            total_max = counter[num]
        end
    end

    total_max
end
