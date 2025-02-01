# @param {Integer[]} nums
# @return {Boolean}
def is_array_special(nums)
    nums.each_cons(2).all? { |a, b| ((a & 1) ^ (b & 1)) == 1 }
end
