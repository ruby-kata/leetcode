# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
    nums.map(&:to_s).sort { |s1, s2| (s2 + s1) <=> (s1 + s2) }.join.tap {|x| return '0' if x.start_with?('0') }
end
