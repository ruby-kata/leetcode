# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
    num_of_five = 0
    while n > 0
        n /= 5
        num_of_five += n
    end

    num_of_five
end
