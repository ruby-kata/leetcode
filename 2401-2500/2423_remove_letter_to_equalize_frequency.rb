# @param {String} word
# @return {Boolean}
def equal_frequency(word)
    counter = Hash.new(0)
    word.each_char do |c|
        counter[c.ord] += 1
    end
    frequency = counter.values

    (0...frequency.size).each do |i|
        frequency[i] -= 1
        
        all_eql = true
        eql = nil
        (0...frequency.size).each do |i|
            next if frequency[i] == 0 || (eql ||= frequency[i]) == frequency[i]
            all_eql = false
            break
        end
        return true if all_eql

        frequency[i] += 1
    end

    false
end
