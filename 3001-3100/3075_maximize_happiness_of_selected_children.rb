# @param {Integer[]} happiness
# @param {Integer} k
# @return {Integer}
def maximum_happiness_sum(happiness, k)
    happiness.sort!
    
    sum = 0
    k.times do |i|
        h = (happiness.pop - i)
        break if h <= 0

        sum += h
    end

    sum
end
