# @param {String} word
# @return {Integer}
def possible_string_count(word)
    word.chars.each_cons(2).count { |prev, curr| prev == curr } + 1
end
