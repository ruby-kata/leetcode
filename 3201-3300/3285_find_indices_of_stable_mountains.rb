# @param {Integer[]} height
# @param {Integer} threshold
# @return {Integer[]}
def stable_mountains(height, threshold)
    (1...height.size).select { |i| height[i-1] > threshold }
end
