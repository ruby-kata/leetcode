# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
    max = Array.new(2) { Array.new(text1.size+1, 0) }
    flag = 0

    (text2.size-1).downto(0) do |i|
        flag = 1 - flag
        (text1.size-1).downto(0) do |j|
            matched = text2[i] == text1[j] ? 1 : 0
            max[flag][j] = [
                matched + max[1-flag][j+1],
                max[flag][j+1],
                max[1-flag][j]
            ].max
        end
    end

    max[flag][0]
end
