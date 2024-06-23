# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
    counter = nums.tally
    result = []
    backtrack = lambda { |perm|
        if perm.size == nums.size
            result.push(perm.clone)
            return
        end

        counter.keys.each do |num|
            next unless counter[num] > 0

            counter[num] -= 1
            perm.push(num)
            backtrack.call(perm)
            perm.pop
            counter[num] += 1
        end
    }

    backtrack.call([])
    result
end
