# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {String[][]}
def find_ladders(begin_word, end_word, word_list)
    def dfs(seq, target, dict, dist, shortest)
        if seq.first == target
            shortest << seq.clone
            return 
        end

        word = seq.first.clone
        d = dist[word]
        (0...word.length).each do |i|
            origin = word[i]
            ('a'..'z').each do |c|
                next if c == origin

                word[i] = c
                if dict.has_key?(word) && dist[word] == d - 1
                    seq.unshift(word.clone)
                    dfs(seq, target, dict, dist, shortest)
                    seq.shift
                end
            end
            word[i] = origin
        end
    end

    dict = {}
    word_list.each do |word|
        dict[word] = true
    end
    dict[begin_word] = true

    dist = {}
    dist[begin_word] = d = 0
    queue = [begin_word]
    until queue.empty?
        queue.size.times do
            word = queue.shift
            w = word.clone
            (0...word.length).each do |i|
                origin = w[i]
                ('a'..'z').each do |c|
                    next if c == origin

                    w[i] = c
                    if dict.has_key?(w) && !dist.has_key?(w)
                        dist[w] = d + 1
                        queue << w.clone
                    end
                end
                w[i] = origin
            end
        end
        d += 1
    end

    return [] unless dist.has_key?(end_word)

    dfs([end_word], begin_word, dict, dist, shortest = [])
    shortest
end
