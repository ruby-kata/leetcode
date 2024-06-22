# @param {Integer[][]} land
# @return {Integer[][]}
def find_farmland(land)
    def dfs(land, r, c, group = [r, c, r, c])
        land[r][c] = -1
        group[2] = [r, group[2]].max
        group[3] = [c, group[3]].max

        if c < land[0].size-1 && land[r][c+1] == 1
            dfs(land, r, c+1, group)
        end

        if r < land.size-1 && land[r+1][c] == 1
            dfs(land, r+1, c, group)
        end
        
        group
    end

    farmlands = []
    (0...land.size).each do |i|
        (0...land[0].size).each do |j|
            farmlands << dfs(land, i, j) if land[i][j] == 1
        end
    end

    farmlands
end
