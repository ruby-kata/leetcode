# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    open_max_count = 0
    open_min_count = 0
    s.each_char do |c|
        if c == '('
            open_max_count += 1
            open_min_count += 1
        elsif c == ')'
            open_min_count -= 1 if open_min_count > 0
            open_max_count -= 1
            return false if open_max_count < 0
        else
            open_min_count -= 1 if open_min_count > 0
            open_max_count += 1
        end
    end

    open_min_count.zero?
end
