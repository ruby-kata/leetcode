# @param {Integer[]} position
# @param {Integer} m
# @return {Integer}
def max_distance(position, m)
    position.sort!
    num_ball_with_min_force = lambda { |force|
        count = 1
        x = position[0]
        (1...position.length).each { |i|
            if (position[i] - x) >= force
                count += 1 
                x = position[i]
            end
        }
        count
    }

    low = 1
    high = position.last - position.first
    while low < high
        mid = (low + high)/2
        if num_ball_with_min_force.call(mid) < m
            high = mid
        else
            low = mid + 1
        end
    end
    
    num_ball_with_min_force.call(low) >= m ? low : low - 1
end
