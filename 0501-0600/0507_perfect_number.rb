# @param {Integer} num
# @return {Boolean}
def check_perfect_number(num)
    return false if num == 1

    sum = 1
    (2..Math.sqrt(num)).each { |i|
        sum += i + num/i if num % i == 0
    }

    sum == num
end
