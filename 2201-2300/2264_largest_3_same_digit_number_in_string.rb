# @param {String} num
# @return {String}
def largest_good_integer(num)
    max = ''
    (0..num.size-3).each do |i|
        if num[i] == num[i+1] && num[i+1] == num[i+2]
            max = num[i] if max < num[i]
            break if max == '9'
        end
    end

    max * 3
end
