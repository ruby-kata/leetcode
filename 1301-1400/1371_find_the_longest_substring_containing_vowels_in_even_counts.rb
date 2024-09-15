# @param {String} s
# @return {Integer}
def find_the_longest_substring(s)
    longest = 0
    vowels = 'aeiou'.freeze
    xor = Hash.new
    xor[0] = -1
    bitmask = 0
    s.chars.each_with_index { |c, i|
        if j = vowels.index(c)
            bitmask ^= (1 << j)
        end

        if xor.has_key?(bitmask)
            longest = [longest, i - xor[bitmask]].max
        else
            xor[bitmask] = i
        end
    }

    longest
end
