# @param {String} s
# @return {Integer}
def count_palindromic_subsequence(s)
    first_positions = Array.new(27, -1)
    last_positions = Array.new(27, -1)
    counter = Array.new(27) { Array.new(s.size, 0) }

    s.each_char.with_index do |c, i|
        c_index = c.ord - 97
        first_positions[c_index] = i if first_positions[c_index] < 0
        last_positions[c_index] = i
        if i > 0
            (0..26).each do |letter|
                counter[letter][i] = counter[letter][i-1]
            end
        end
        counter[c_index][i] += 1
    end

    count = 0
    (0..26).each do |first_letter|
        if (f=first_positions[first_letter]) < (l=last_positions[first_letter])
            (0..26).each do |mid_letter|
                count += 1 if counter[mid_letter][l] - counter[mid_letter][f] > (mid_letter == first_letter ? 1 : 0)
            end
        end
    end

    count
end
