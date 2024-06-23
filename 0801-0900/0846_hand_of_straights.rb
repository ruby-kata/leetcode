# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
    counter = hand.tally
    counter.keys.sort.each { |num|
        next unless counter[num] > 0

        s = counter[num]
        counter[num] -= s
        (1...group_size).each { |i|
            return false if !counter.has_key?(num + i) || counter[num + i] < s
            counter[num + i] -= s
        }
    }

    true
end
