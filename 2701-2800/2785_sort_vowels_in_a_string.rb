# @param {String} s
# @return {String}
def sort_vowels(s)
    vowels = 'aeiouAEIOU'
    svowels = []
    (0...s.length).each do |i|
        svowels << s[i] if vowels.include?(s[i])
    end

    svowels.sort!
    (0...s.length).each do |i|
        s[i] = svowels.shift if vowels.include?(s[i])
    end

    s
end
