# @param {String[]} arr
# @return {Integer}
def max_length(arr)
    bits = arr.map do |s|
        s.chars.reduce(0) do |bit, c|
            bit_index = (1 << (c.ord - 97))
            break 0 if (bit_index & bit) != 0
            bit |= bit_index
        end
    end

    def backtrack(arr, bits, curBit, i)
        return 0 if i >= arr.size

        ignore_case = backtrack(arr, bits, curBit, i + 1)
        consume_case = (bits[i] != 0 && (bits[i] & curBit) == 0) ? arr[i].size + backtrack(arr, bits, curBit | bits[i], i + 1) : 0

        [ignore_case, consume_case].max
    end

    backtrack(arr, bits, 0, 0)
end
