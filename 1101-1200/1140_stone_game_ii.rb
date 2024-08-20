# @param {Integer[]} piles
# @return {Integer}
def stone_game_ii(piles)
    prefix_sum = Array.new(piles.size+1, 0)
    prefix_sum[0] = 0
    (0...piles.size).each { |i|
        prefix_sum[i+1] = prefix_sum[i] + piles[i]
    }

    dp = Array.new(piles.size+1) { Array.new(piles.size+1, 0) }

    (piles.size-1).downto(0) { |i|
        sum = prefix_sum[-1] - prefix_sum[i]
        (1..piles.size).each { |m|
            (1..[2*m, piles.size].min).each { |x|
                next_i = [i+x, piles.size].min
                next_m = [m, x].max
                dp[i][m] = [dp[i][m], sum - dp[next_i][next_m]].max
            }
        }
    }

    dp[0][1]
end


# @param {Integer[]} piles
# @return {Integer}
def stone_game_ii(piles)
    prefix_sum = Array.new(piles.size+1, 0)
    prefix_sum[0] = 0
    (0...piles.size).each { |i|
        prefix_sum[i+1] = prefix_sum[i] + piles[i]
    }

    mem = Array.new(piles.size) { Array.new(piles.size+1) }

    optimally_play = lambda { |i, m|
        sum = prefix_sum[-1] - prefix_sum[i]
        return sum if m * 2 >= piles.size - i
        return mem[i][m] if mem[i][m]
        
        mem[i][m] = (1..2*m).map { |j| 
            sum - optimally_play.call(i + j, [m, j].max) 
        }.max
    }

    optimally_play.call(0, 1)
end
