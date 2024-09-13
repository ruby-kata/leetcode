# @param {Integer} num1
# @param {Integer} num2
# @param {Integer} num3
# @return {Integer}
def generate_key(num1, num2, num3)
    [
        num1.to_s.rjust(4, '0').chars,
        num2.to_s.rjust(4, '0').chars,
        num3.to_s.rjust(4, '0').chars
    ]
    .transpose
    .map(&:min)
    .join
    .to_i
end

def generate_key(num1, num2, num3)
    Array.new(4, 9999)
    .zip(num1.digits, num2.digits, num3.digits)
    .map { _1.map(&:to_i).min }
    .join.reverse
    .to_i
end

def generate_key(num1, num2, num3)
    [1, 10, 100, 1000].sum {|d| [num1, num2, num3].map {|n| n / d % 10}.min * d}
end
