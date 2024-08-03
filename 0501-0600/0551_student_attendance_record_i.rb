# @param {String} s
# @return {Boolean}
def check_record(s)
    a_count = 0
    l_count = 0
    l_prev = -1
    (0...s.length).each { |i|
        if s[i] == 'A'
            a_count += 1
            return false if a_count >= 2
        elsif s[i] == 'L'
            if l_prev == i - 1
                l_count += 1
                return false if l_count >= 3
            else
                l_count = 1
            end
            l_prev = i
        end
    }

    true
end
