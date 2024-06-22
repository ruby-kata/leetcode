# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target, index = 0, sum = 0, combi = [])
    return [] if sum > target
    return [combi] if sum == target
    combination_sum(candidates, target, index, sum + candidates[index], combi + [candidates[index]]) +
        (index < candidates.size-1 ? combination_sum(candidates, target, index+1, sum, combi) : [])
end
