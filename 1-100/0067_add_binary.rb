# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    result = []
    rem, i, j = 0, a.size-1, b.size-1
    until i < 0 and j < 0
        sum = rem + (i >= 0 ? a[i] : nil).to_i + (j >= 0 ? b[j] : nil).to_i
        result.unshift(sum % 2)
        rem = sum >= 2 ? 1 : 0
        i -= 1
        j -= 1
    end
    result.unshift(rem) if rem == 1

    result.join("")
end
