# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
    digits = num.digits.reverse
    
    last_indexes = Hash.new(-1)
    digits.each_with_index { |d, i| last_indexes[d] = i }

    catch(:done) {
        (0...digits.size).each { |i|
            9.downto(digits[i]+1) { |d|
                if last_indexes[d] > i
                    digits[i], digits[last_indexes[d]] = digits[last_indexes[d]], digits[i]
                    throw :done
                end
            }
        }
    }

    digits.join.to_i
end
