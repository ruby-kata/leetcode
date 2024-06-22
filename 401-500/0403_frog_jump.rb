# @param {Integer[]} stones
# @return {Boolean}
def can_cross(stones)
    memo = Array.new(stones.size) { Array.new(stones.size) }
    can_jump = -> (stone_index, distance, jump) {
        return true if stone_index == stones.size-1 && stones[stone_index] == distance
        return false if stone_index >= stones.size || stones[stone_index] > distance || jump <= 0

        return memo[stone_index][jump] unless memo[stone_index][jump].nil?

        if stones[stone_index] < distance
            can_jump.call(stone_index + 1, distance, jump)
        else
            memo[stone_index][jump] = can_jump.call(stone_index + 1, distance + jump, jump) || 
                                can_jump.call(stone_index + 1, distance + jump + 1, jump + 1) || 
                                can_jump.call(stone_index + 1, distance + jump - 1, jump - 1)
        end
    }

    can_jump.call(1, stones[0] + 1, 1)
end
