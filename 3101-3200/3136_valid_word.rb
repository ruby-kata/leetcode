# @param {String} word
# @return {Boolean}
def is_valid(word)
    reg1 = /[0-9a-zA-Z]/.freeze
    reg2 = /[aeuioAEUIO]/.freeze
    reg3 = /[a-zA-Z&&[^aeuioAEUIO]]/.freeze
    count = 0
    vowel = false
    consonant = false

    word.each_char { |c|
        count += 1
        return false if reg1.match(c) == nil

        unless vowel
            vowel = reg2.match(c) != nil
        end

        unless consonant
            consonant = reg3.match(c) != nil
        end
    }

    count >= 3 && vowel && consonant
end

def is_valid(word)
    !(/^[0-9a-z]{3,}$/i =~ word).nil? &&
    !(/[aeiuo]/i =~ word).nil? &&
    !(/[^aeiuo0-9]/i =~ word).nil?
end

def is_valid(word)
    word.match?(/^(?=.*[b-df-hj-np-tv-z])(?=.*[aieou])[a-z0-9]{3,}$/i)
end
