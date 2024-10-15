# @param {String} s
# @return {Integer}
def minimum_steps(s)
    steps = 0
    count_ones = 0
    s.each_char { |c|
        if c == "0"
            steps += count_ones
        else
            count_ones += 1
        end
    }

    steps
end
