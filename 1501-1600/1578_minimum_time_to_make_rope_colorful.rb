# @param {String} colors
# @param {Integer[]} needed_time
# @return {Integer}
def min_cost(colors, needed_time)
    min_sum_time = 0
    max_curr_time = 0
    sum_curr_time = 0
    prev_c = nil
    colors.chars.each.with_index do |c, i|
        if prev_c != c
            min_sum_time += sum_curr_time - max_curr_time
            max_curr_time = 0
            sum_curr_time = 0
        end
        
        max_curr_time = needed_time[i] if max_curr_time < needed_time[i]
        sum_curr_time += needed_time[i]
        prev_c = c
    end

    min_sum_time += sum_curr_time - max_curr_time
end



# more Ruby style =))
def min_cost(colors, needed_time)
    colors.chars.zip(needed_time).each_cons(2).reduce([0, needed_time.first]) do |(sum, max_curr_time), ((prev_c, prev_t), (c, t))|
        if prev_c == c
            if max_curr_time < t
                sum += max_curr_time
                max_curr_time = t
            else
                sum += t
            end
        else
            max_curr_time = t
        end
        [sum, max_curr_time]
    end.first
end