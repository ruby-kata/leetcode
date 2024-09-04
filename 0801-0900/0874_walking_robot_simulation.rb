# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}
def robot_sim(commands, obstacles)
    obstacles_map = obstacles.tally

    max = 0
    curr_x = curr_y = 0
    dx = 0
    dy = 1
    commands.each { |c|
        if c == -2
            # counter-clockwise rotate -90
            # 0 -1
            # 1 0
            dx, dy = dx*0 - dy, dx + 0*dy
        elsif c == -1
            # clockwise rotate 90
            # 0 1
            # -1 0
            dx, dy = dx*0 + dy, -dx + 0*dy
        else
            d = 0
            (1..c).each { |i|
                x = curr_x + dx * i
                y = curr_y + dy * i
                break if obstacles_map[[x, y]]
                d = i
            }
            curr_x += dx * d
            curr_y += dy * d
            max = [max, curr_x**2 + curr_y**2].max
        end
    }

    max
end
