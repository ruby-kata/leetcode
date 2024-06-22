# @param {Integer} n
# @return {Boolean}
def is_happy(n)
    repeat = {}
    until repeat.has_key?(n)
        repeat[n] = true
        n = n.digits.sum { |x| x*x }
    end

    n == 1
end
