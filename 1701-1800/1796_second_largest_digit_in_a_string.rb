# @param {String} s
# @return {Integer}
def second_highest(s)
    largest = "-1"
    second_largest = "-1"
    s.chars.each do |c|
        next unless "0" <= c && c <= "9"

        if c > largest
            second_largest = largest
            largest = c
        elsif c < largest && c > second_largest
            second_largest = c
        end
    end

    second_largest.to_i
end
