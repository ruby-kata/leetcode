# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
    w = words[0].size
    words_size = words.size
    words_len = words_size * w
    return [] if words_len > s.length
    
    words_map = Hash.new(0)
    words.each do |word|
        words_map[word] += 1
    end

    pos = Hash.new
    start = 0
    while start <= s.length-words_len
        words_seen = Hash.new(0)
        words_counter = 0
        i = start
        until i > s.length - w
            word = s.slice(i, w)
            break unless words_map.has_key?(word) && words_seen[word] < words_map[word]
            words_seen[word] += 1
            words_counter += 1
            i += w
            break if words_counter == words_size
        end

        if words_size == words_counter
            pos[start] = true
            j = start
            while i <= s.length - w && s.slice(j, w) == s.slice(i, w)
                j += w
                i += w
                pos[j] = true
            end

            start = j if w == 1
        end

        start += 1
        start += 1 while start <= s.length-words_len && pos.has_key?(start)
    end

    pos.keys
end
