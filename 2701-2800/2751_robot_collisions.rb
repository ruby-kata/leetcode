# @param {Integer[]} positions
# @param {Integer[]} healths
# @param {String} directions
# @return {Integer[]}
def survived_robots_healths(positions, healths, directions)
    order = [positions, healths, directions.chars].transpose.sort_by(&:first)
    stack = []
    order.each { |(p, h, d)|
        while !stack.empty? && stack[-1][-1] == 'R' && d == 'L'
            if stack[-1][-2] == h
                stack.pop
                h = 0
            elsif stack[-1][-2] < h
                stack.pop
                h -= 1
            else
                stack[-1][-2] -= 1
                h = 0
            end
            break if h == 0
        end
        stack << [p, h, d] if h > 0
    }
    
    remain = stack.map { |(p, h, d)| [p, h] }.to_h
    positions.select { |p| remain.has_key?(p) }.map { |p| remain[p] }
end
