# @param {String} s
# @return {String}
def make_fancy_string(s)
    fancy = ""
    prev_c = ""
    prev_count = 0
    s.each_char { |c|
        if c != prev_c
            fancy << c
            prev_c = c
            prev_count = 1
        else
            prev_count += 1
            fancy << c if prev_count < 3
        end
    }

    fancy
end
