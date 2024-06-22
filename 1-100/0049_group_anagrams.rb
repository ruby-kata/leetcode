# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    anagrams = Hash.new { |h, k| h[k] = [] }
    strs.each do |str|
        str_hash = str.each_byte.tally.hash
        anagrams[str_hash] << str
    end

    anagrams.values
end
