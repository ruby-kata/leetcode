# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
    return "0" if num1 == "0" or num2 == "0"
    
    result = []
    i = 0
    (num1.size-1).downto(0) do |i1|
        j = i
        rem = 0
        (num2.size-1).downto(0) do |i2|
            n = num1[i1].to_i * num2[i2].to_i + rem
            rem = n/10
            sum = (result[j] || 0) + n % 10
            result[j] = sum % 10
            result[j+1] = (result[j+1] || 0) + sum/10 if sum >= 10
            j += 1
        end
        result[j] = (result[j] || 0) + rem if rem > 0
        i += 1
    end

    result.reverse.join("")
end
