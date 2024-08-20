# @param {Integer[]} nums
# @return {Boolean}
def can_alice_win(nums)
    # single, double = nums.partition { |num| num < 10}
    # single.sum != double.sum
    nums.partition { |num| num < 10 }.map(&:sum).reduce(&:!=)
end
