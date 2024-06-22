# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
    chars_hash = chars.chars.tally

    sum_len = 0
    words.each do |word|
        sum_len += word.length if word.chars.tally.all? { |c, count| chars_hash.has_key?(c) && chars_hash[c] >= count }
    end

    sum_len
end
