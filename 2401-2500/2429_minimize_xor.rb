# @param {Integer} num1
# @param {Integer} num2
# @return {Integer}
def minimize_xor(num1, num2)
    def count_set_bits(n)
        c = 0
        while n > 0
            c += 1
            n &= n - 1
        end
        c
    end

    num2_set_bits = count_set_bits(num2)
    num1_set_bits = count_set_bits(num1)
    x = num1

    if num1_set_bits >= num2_set_bits
        left_padding = num1_set_bits - num2_set_bits
        i = 0
        while left_padding > 0
            left_padding -= 1 if (x & 1) == 1
            x >>= 1
            i += 1
        end
        x << i
    else
        right_padding = num2_set_bits - num1_set_bits 
        j = 0
        while right_padding > 0
            if (x & (1 << j)) == 0
                x |= (1 << j)
                right_padding -= 1
            end
            j += 1
        end
        x
    end
end
