# @param {String} s
# @return {Boolean}
def halves_are_alike(s)
    vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    count = 0
    (0...s.size/2).each do |i|
        count += 1 if vowels.include?(s[i])
    end

    (s.size/2...s.size).each do |j|
        count -= 1 if vowels.include?(s[j])
    end

    count == 0
end
