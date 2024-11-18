# @param {Integer[]} code
# @param {Integer} k
# @return {Integer[]}
def decrypt(code, k)
    return Array.new(code.size, 0) if k == 0

    head = k > 0 ? 0 : code.size + k - 1
    tail = k > 0 ? k-1 : code.size - 2
    sum = code[head..tail].sum 
    (0...code.size).map { |i|
        sum += code[(tail + i + 1) % code.size] - code[(head + i) % code.size]    
    }
end
