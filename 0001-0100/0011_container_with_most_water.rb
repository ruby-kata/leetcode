def min(x, y)
    x <= y ? x : y
end

def max(x, y)
    x >= y ? x : y
end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    max = 0
    l, r = 0, height.size-1
    while l < r
        max = max(max, (r-l) * min(height[l], height[r]))
        
        if height[l] < height[r]
            loop do
                l += 1
                break if l >= height.size || height[l] > height[l-1]
            end
        else
            loop do
                r -= 1
                break if r <= 0 || height[r] > height[r+1]
            end
        end
    end

    max
end
