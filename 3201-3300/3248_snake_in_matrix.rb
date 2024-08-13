# @param {Integer} n
# @param {String[]} commands
# @return {Integer}
def final_position_of_snake(n, commands)
    i = j = 0
    commands.each { |c|
        case c
        when "LEFT"
            j -= 1
        when "RIGHT"
            j += 1
        when "DOWN"
            i += 1
        when "UP"
            i -= 1
        end
    }

    i * n + j
end
