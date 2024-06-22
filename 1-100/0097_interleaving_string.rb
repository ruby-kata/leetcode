# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
    return false if s1.size + s2.size != s3.size
    return s1 == s3 if s2.size == 0
    return s2 == s3 if s1.size == 0

    alternative_check = ->(i1, i2, memo) {
        return i1 + i2 == s3.size if i1 == s1.size && i2 == s2.size
        return memo[i1][i2] unless memo[i1][i2].nil?
        return memo[i1][i2] = (s1[i1] == s3[i1 + i2] && alternative_check.call(i1 + 1, i2, memo)) ||
                                (s2[i2] == s3[i1 + i2] && alternative_check.call(i1, i2 + 1, memo))

    }

    alternative_check.call(0, 0, Array.new(s1.size+1) { Array.new(s2.size+1) })
end
