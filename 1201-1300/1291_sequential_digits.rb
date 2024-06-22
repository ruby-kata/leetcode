# @param {Integer} low
# @param {Integer} high
# @return {Integer[]}
def sequential_digits(low, high)
    low_size = low.to_s.size
    high_size = high.to_s.size
    ans = []

    (low_size..high_size).each do |len|
        (1..9-len+1).each do |d|
            num = 0
            (1..len).each do |i|
                num = num * 10 + d
                d += 1
            end

            break if num > high
            ans << num if num >= low
        end
    end

    ans
end
