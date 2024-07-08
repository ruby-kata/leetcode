# @param {Integer[]} height
# @return {Integer}
def trap(height)
    sum = 0
    l = 0
    r = height.size - 1
    maxl = maxr = 0
    while l < r
        if height[l] <= height[r]
            if maxl < height[l]
                maxl = height[l]
            else
                sum += maxl - height[l]
            end
            l += 1
        else
            if maxr < height[r]
                maxr = height[r]
            else
                sum += maxr - height[r]
            end
            r -= 1
        end
    end

    sum
end
