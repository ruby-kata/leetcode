# @param {String} s
# @return {Integer}
def balanced_string_split(s)
    count = 0
    r = l = 0
    s.each_char do |c|
        if c == "R"
            r += 1
        else 
            l += 1
        end

        if r == l
            r = l = 0
            count += 1
        end
    end

    count
end
