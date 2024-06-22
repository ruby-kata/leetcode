# @param {String} s
# @return {String}
def longest_nice_substring(s)
    chars = Hash.new(false)
    s.each_char.with_index do |c, i|
        chars[c] = true
    end

    (0...s.size).each do |i|
        next if chars[s[i]] && chars[s[i].swapcase]
        
        l = longest_nice_substring(s[0...i])
        r = longest_nice_substring(s[i+1..-1])
        return l.size >= r.size ? l : r
    end

    s
end
