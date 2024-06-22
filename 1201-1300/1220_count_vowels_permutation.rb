# @param {Integer} n
# @return {Integer}
def count_vowel_permutation(n)
    mod = 1000000007
    vowel = ['a', 'e', 'i', 'o', 'u']
    counter = Hash.new { |h, k| h[k] = Array.new(2, 1) }
    flag = 0

    (n-1).times do
        flag = 1 - flag
        vowel.each do |c|
            case c
            when 'a'
                counter[c][flag] = counter['e'][1-flag]
            when 'e'
                counter[c][flag] = counter['a'][1-flag] + counter['i'][1-flag]
            when 'i'
                counter[c][flag] = counter['a'][1-flag] + counter['e'][1-flag] + counter['o'][1-flag] + counter['u'][1-flag]
            when 'o'
                counter[c][flag] = counter['i'][1-flag] + counter['u'][1-flag]
            when 'u'
                counter[c][flag] = counter['a'][1-flag]
            end

            counter[c][flag] %= mod
        end
    end

    sum = 0
    vowel.each do |c| 
        sum += counter[c][flag]
        sum %= mod
    end

    sum
end
