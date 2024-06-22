# @param {Integer[]} arr
# @return {Integer}
def count_triplets(arr)
    count = 0
    xor_indexes = Hash.new { |h, k| h[k] = [] }
    xor_indexes[0] << 0
    prefix_xors = Array.new(arr.length+1, 0)
    xor = 0
    k = 0
    while k < arr.length
        xor ^= arr[k]
        if xor_indexes.has_key?(xor)
            xor_indexes[xor].each do |i|
                (i+1..k).each do |j|
                    count += 1 if (prefix_xors[j] ^ prefix_xors[i]) == (prefix_xors[k+1] ^ prefix_xors[j])
                end
            end
        end
        xor_indexes[xor] << (k+1)
        prefix_xors << xor.dup
        k += 1
    end

    count
end
