# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    (1..n).map { |i| 
        i % 3 == 0 ? (i % 5 == 0 ? 'FizzBuzz' : 'Fizz') : (i % 5 == 0 ? 'Buzz' : i.to_s)
    }
end
