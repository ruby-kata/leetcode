# @param {String} s
# @return {Integer}
def num_steps(s)
    count = 0
    rem = bit = 0
    (s.length-1).downto(1) { |i|
        bit = s[i].to_i + rem
        if bit == 1
            rem = 1
            count += 2
        else
            rem = bit/2
            count += 1
        end
    }

    last_bit = s[0].to_i + rem
    count + last_bit/2
end
