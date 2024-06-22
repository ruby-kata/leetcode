# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
    hash = Hash.new
    words.each_with_index do |w, i|
        hash[w] = i
    end

    chars = "qwertyuioplkjhgfdsazxcvbnm"
    longests = Array.new(words.size)
    find_longest = ->(i) {
        return longests[i] if longests[i]

        longest = 1
        word = words[i]
        (0..word.size).each do |j|
            l = word[0...j]
            r = word[j..-1]
            chars.each_char do |c|
                _w = l + c + r
                if hash[_w]
                    lj = find_longest.call(hash[_w])
                    longest = lj + 1 if longest < lj + 1
                end
            end
        end

        longests[i] = longest
    }

    longest = 1
    (0...words.size).each do |i|
        li = find_longest.call(i)
        longest = li if longest < li
    end

    longest
end
