# @param {Integer[][]} nums
# @return {Integer[]}
def find_diagonal_order(nums)
    order = []
    (0...nums.size).each do |r|
        (0...nums[r].size).each do |c|
            i = r + c
            order[i] ||= []
            order[i].unshift(nums[r][c])
        end
    end

    order.inject(&:concat)
end
