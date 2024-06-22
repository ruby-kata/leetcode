# @param {Integer} n
# @return {Integer}
def subtract_product_and_sum(n)
    sum = 0
    product = 1
    n.digits.each do |d|
        sum += d
        product *= d
    end

    product - sum
end
