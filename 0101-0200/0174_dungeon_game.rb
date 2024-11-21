# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
    dfs = lambda { |r, c, memo|
        return (dungeon[r][c] >= 0 ? 0 : dungeon[r][c]) if r == memo.length - 1 && c == memo[0].length - 1
        return -Float::INFINITY if r >= memo.length || c >= memo[0].length
        return memo[r][c] if memo[r][c]

        hp = dungeon[r][c] + [dfs.call(r+1, c, memo), dfs.call(r, c+1, memo)].max
        memo[r][c] = hp >= 0 ? 0 : hp
    }

    memo = Array.new(dungeon.length) { Array.new(dungeon[0].length) }
    init_health = dfs.call(0, 0, memo)
    init_health > 0 ? 0 : -init_health + 1
end

def calculate_minimum_hp(dungeon)
    rows = dungeon.length
    cols = dungeon[0].length
    dp = Array.new(rows+1) { Array.new(cols+1, Float::INFINITY) }
    dp[rows][cols-1] = dp[rows-1][cols] = 1
    
    (rows - 1).downto(0) { |r|
        (cols - 1).downto(0) { |c|
            dp[r][c] = [dp[r+1][c], dp[r][c+1]].min - dungeon[r][c]
            dp[r][c] = 1 if dp[r][c] <= 0
        }
    }

    dp[0][0]
end
