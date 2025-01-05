# @param {String} s
# @param {Integer[][]} shifts
# @return {String}
def shifting_letters(s, shifts)
    alphabets = ('a'..'z').to_a.freeze

    shift_count = Array.new(s.size + 1, 0)
    shifts.each { |l, r, direction|
        d = direction == 0 ? -1 : 1
        shift_count[l] += d # add for left to right
        shift_count[r+1] -= d # reset after right
    }

    curr_shift = 0
    s.chars.map.with_index { |c, i|
        # curr_shift adds shift_count[left] only once from left to right
        # since all shift_count from left+1 to right are zero
        curr_shift += shift_count[i]
        alphabets[(c.ord - 97 + curr_shift) % alphabets.size]
    }.join('')
end
