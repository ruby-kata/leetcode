# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Integer}
def find_minimum_operations(s1, s2, s3)
    max = [s1.size, s2.size, s3.size].max
    not_equal_last_index = max
    max.downto(0) { |i|
        not_equal_last_index = i if s1[i] != s2[i] || s2[i] != s3[i]
    }

    return -1 if not_equal_last_index == 0

    [s1.size - not_equal_last_index, 0].max +
    [s2.size - not_equal_last_index, 0].max + 
    [s3.size - not_equal_last_index, 0].max
end
