# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    1 + s.chars.tally.inject(0) { |sum, (c, count)| sum += (count/2)*2 }
end
