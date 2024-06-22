# @param {String} num
# @return {Boolean}
def digit_count(num)
    counter = Hash.new(0)
    num.each_char do |c|
        counter[c.to_i] += 1
    end

    (0...num.size).each do |i|
        return false if counter[i] != num[i].to_i
    end

    true
end
