# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
    return false if s1.length > s2.length

    counter_chars = ('a'..'z').map { |c| [c, 0] }.to_h
    counter1 = counter_chars.merge(s1.chars.tally)
    counter2 = counter_chars.merge(s2[0...s1.length].chars.tally)
    return true if counter1 == counter2
    
    (s1.length...s2.length).each { |i|
        counter2[s2[i-s1.length]] -= 1
        counter2[s2[i]] += 1
        return true if counter1 == counter2
    }

    false
end
