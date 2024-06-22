# @param {Integer[]} nums
# @return {Integer[][]}
def find_matrix(nums)
    matrix = []
    counter = nums.tally
    counter.each do |num, count|
        (0...count).each do |i|
            matrix[i] ||= []
            matrix[i] << num
        end
    end

    matrix
end
