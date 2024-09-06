# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    return 1 if n.zero?

    sum = 10
    curr = 10
    (n-1).times { |i|
        # with n digits, there're 10*9*..(10-n) combinations distinct digits numbers
        curr = curr * (10-i-1)
        # not count invalid numbers with 0 lead, there're 9*8*..(10-n) those numbers
        sum += curr - curr/10
    }

    sum
end
