# @param {String} s
# @return {String}
def freq_alphabets(s)
    map = ""
    i = 0
    while i <= s.length-1
        if i <= s.length-3 && s[i+2] == "#"
            map << (s[i].to_i * 10 + s[i+1].to_i + 96).chr
            i += 3
        else
            map << (s[i].to_i + 96).chr
            i += 1
        end
    end

    map
end
