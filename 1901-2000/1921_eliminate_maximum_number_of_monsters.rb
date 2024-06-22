# @param {Integer[]} dist
# @param {Integer[]} speed
# @return {Integer}
def eliminate_maximum(dist, speed)
    times = dist.map.with_index do |d, i|
        (d.to_f/speed[i]).ceil
    end

    times.sort!

    t = 0
    until times.empty?
        return t if times.shift <= t
        t += 1 
    end

    t
end
