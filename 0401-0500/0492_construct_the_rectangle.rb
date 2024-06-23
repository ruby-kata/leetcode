# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
    w = Math.sqrt(area).to_i
    w -= 1 until area % w == 0
    [area/w, w]
end

# Time Limit Exceeded
def construct_rectangle(area)
    # w * (w + d) = area
    # w*w + w*d - area = 0
    # w = (-d + (d*d - 4*area).sqrt)/2
    d = 0
    while d < area - 1
        w = ((-d + Math.sqrt(d*d + 4*area))/2).to_i
        l = w + d
        return [l, w] if w * l == area
        d += 1
    end

    [area, 1]
end
