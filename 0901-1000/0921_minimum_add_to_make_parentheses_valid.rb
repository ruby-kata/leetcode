# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
    open_count = close_count = 0
    s.each_char { |c|
        if c == "("
            open_count += 1
        else
            if open_count == 0
                close_count += 1
            else
                open_count -= 1
            end
        end
    }

    open_count + close_count
end
