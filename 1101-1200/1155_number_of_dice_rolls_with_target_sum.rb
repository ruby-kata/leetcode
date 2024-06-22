# @param {Integer} n
# @param {Integer} k
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(n, k, target)
    mod = 1000000007
    ways = Array.new(n+1) { Array.new(target+1, 0) }
    (1..k).each { |i| ways[1][i] = 1 }

    (2..n).each do |i|
        (1..k).each do |curr_dice|
            (1..target-curr_dice).each do |sum_next_dices|
                if ways[i-1][sum_next_dices] > 0
                    ways[i][curr_dice + sum_next_dices] += ways[i-1][sum_next_dices]
                    ways[i][curr_dice + sum_next_dices] %= mod
                end
            end
        end
    end

    ways[n][target]
end
