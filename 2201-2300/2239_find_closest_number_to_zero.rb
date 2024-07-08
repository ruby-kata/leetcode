# @param {Integer[]} nums
# @return {Integer}
def find_closest_number(nums)
    min_distance = Float::INFINITY
    closest = nil
    nums.each do |num|
        return 0 if num == 0
        
        num_d = num.abs
        if min_distance == num_d
            closest = [closest, num].max
        elsif min_distance > num_d
            min_distance = num_d
            closest = num
        end 
    end

    closest
end
