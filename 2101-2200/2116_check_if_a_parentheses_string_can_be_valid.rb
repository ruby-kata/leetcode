# @param {String} s
# @param {String} locked
# @return {Boolean}
def can_be_valid(s, locked)
    return false if s.size.odd?

    open_count = 0
    close_count = 0
    return false unless (0...s.size).all? { |i|
        if s[i] == '(' || locked[i] == '0'
            open_count += 1 
        else # s[i] == ')' && locked[i] == '1'
            close_count += 1
        end

        open_count >= close_count
    }

    open_count = 0
    close_count = 0
    (s.size - 1).downto(0).all? { |i|
        if s[i] == '(' && locked[i] == '1'
            open_count += 1 
        else
            close_count += 1
        end

        open_count <= close_count
    }
end
