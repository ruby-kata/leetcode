# @param {Integer[]} nums
# @return {Integer}
def count_ways(nums)
    nums.sort!

    # if the happy of the first student > 0
    # the teacher can choice no one
    count = nums.first > 0 ? 1 : 0
    
    (0...nums.size-1).each { |i|
        count += 1 if nums[i] < i + 1 && nums[i+1] > i + 1
    }

    # add 1 because the teacher always can select all students
    count + 1
end
