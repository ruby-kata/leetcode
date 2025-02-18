# @param {String} pattern
# @return {String}
def smallest_number(pattern, result = [], i = -1, prev_num = 0, prev_pat = "I", used = Array.new(10, false))
    return result.join if i == pattern.size

    (1..9).each { |j|
        if !used[j] && (prev_pat == "D" ? (j < prev_num) : (j > prev_num))
            result << j
            used[j] = true
            
            found = smallest_number(pattern, result, i + 1, j, pattern[i + 1], used)
            return found unless found.nil?

            result.pop
            used[j] = false
        end
    }
    
    nil
end
