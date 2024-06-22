# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
    banned_words = Hash.new
    banned.each { |w| banned_words[w] = true }

    counter = Hash.new(0)
    max = 0
    mcw = nil
    paragraph.split(/[\s!?',;.]+/).each do |w|
        w.downcase!
        next if banned_words.has_key?(w)

        counter[w] += 1
        if max < counter[w]
            mcw = w 
            max = counter[w]
        end
    end

    mcw
end
