# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
    candidates.sort!
    combination(candidates, target)
end

def combination(candidates, target, index = 0, sum = 0, combi = [])
    return [combi] if sum == target
    return [] if index >= candidates.size || sum > target
    
    result = []
    (index...candidates.size).each do |i|
        next if i > index && candidates[i] == candidates[i-1]
        result += combination(candidates, target, i+1, sum + candidates[i], combi + [candidates[i]])
    end

    result
end
