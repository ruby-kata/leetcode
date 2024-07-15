# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_symmetric_integers(low, high)
    (low..high).count do |num|
        digits = num.digits
        next false if digits.length.odd?

        digits[0...digits.length/2].sum == digits[digits.length/2..].sum
    end
end
