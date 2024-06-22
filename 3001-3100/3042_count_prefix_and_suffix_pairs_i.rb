# rolling-hash
# @param {String[]} words
# @return {Integer}
def count_prefix_suffix_pairs(words)
    base = 31
    hashes_counter = Hash.new(0)
    count = 0

    words.each do |word|
        pow = 1
        prefix_hashes = Array.new(word.length+1, 0)
        (0...word.length).each do |i|
            prefix_hashes[i+1] = (prefix_hashes[i] + (word[i].ord - 96) * pow)
            pow = (pow * base)
        end
        
        (0...word.length).each do |i|
            pow = (pow / base)
            suffix_hash = (prefix_hashes[word.length] - prefix_hashes[word.length-i-1]) / pow
            count += hashes_counter[suffix_hash] if suffix_hash == prefix_hashes[i+1]
        end
        
        hashes_counter[prefix_hashes.last] += 1
    end

    count
end
