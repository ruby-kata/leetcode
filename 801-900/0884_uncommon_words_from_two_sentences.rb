# @param {String} s1
# @param {String} s2
# @return {String[]}
def uncommon_from_sentences(s1, s2)
    s1_counter = s1.split(' ').tally
    s2_counter = s2.split(' ').tally
    s1_counter.select { |k, c| c == 1 && !s2_counter.has_key?(k) }.keys +
        s2_counter.select { |k, c| c == 1 && !s1_counter.has_key?(k) }.keys
end
