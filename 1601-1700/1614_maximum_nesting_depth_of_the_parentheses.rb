# @param {String} s
# @return {Integer}
def max_depth(s)
    max = 0
    count = 0
    s.each_char do |c|
        if c == '('
            count += 1
        elsif c == ')'
            max = count if max < count
            count -= 1
        end
    end

    max
end
