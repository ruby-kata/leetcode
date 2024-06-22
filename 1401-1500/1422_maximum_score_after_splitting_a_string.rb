# @param {String} s
# @return {Integer}
def max_score(s)
    chars = s.chars
    total_ones = chars.count {|c| c == "1"}
    
    max_sum = 0
    left_ones = 0
    (0...s.size-1).each do |i|
        left_ones += chars[i] == "1" ? 1 : 0
        sum = (i+1) - left_ones + total_ones - left_ones
        max_sum = sum if sum > max_sum
    end

    max_sum
end
