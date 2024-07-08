# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
    num_bits = Array.new(n+1)
    num_bits[0] = 0
    (1..n).each do |i|
        count = 0
        num = i
        while num > 0
            if num_bits[num] != nil
                count += num_bits[num]
                break
            else
                num &= num - 1
                count += 1
            end
        end
        num_bits[i] = count
    end

    num_bits
end
