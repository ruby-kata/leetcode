# @param {String} num
# @return {Boolean}
def is_additive_number(num)
    n = num[0] == "0" ? 0 : num.size-3
    (0..n).each do |i|
        m = num[i+1] == "0" ? i+1 : num.size-2
        (i+1..m).each do |j|
            first = num[0..i].to_i
            second = num[i+1..j].to_i
            sum = first + second
            ss = sum.to_s
            k = j
            while k < num.size-1
                break if num[k+1..k+ss.size] != ss
                k += ss.size
                first = second
                second = sum
                sum = first + second
                ss = sum.to_s
            end

            return true if k == num.size-1
        end
    end

    false
end
