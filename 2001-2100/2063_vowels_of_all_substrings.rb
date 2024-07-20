# @param {String} word
# @return {Integer}
def count_vowels(word)
    vowels = 'aeiou'.freeze
    vowels_count = 0
    # assume we track all vowel indexes [i1, i2, .., in]
    # ex: xxaxxxuxixxexxoxxa....
    #     [ 2   6 .............]  
    # for each new char c in word at index (in)
    # all new subsets will be collected by sub array from c to every previous chars (vowel or not)
    # if c is a vowel then we will have (in + 1) + ... + (i1 + 1) vowels
    # if c is not a vowel then we will have (in-1 + 1) + ... + (i1 + 1) vowels
    sum_vowel_indexes = 0
    (0...word.size).each { |i|
        if (vowels.include?(word[i]))
            sum_vowel_indexes += i + 1
        end
        vowels_count += sum_vowel_indexes
    }
    
    vowels_count
end
