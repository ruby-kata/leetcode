# @param {String[]} nums
# @return {String}
def find_different_binary_string(nums)
    def backtrack(i, bstr, counter, size)
        if i == size
            ubs = bstr.join("")
            return counter.has_key?(ubs) ? nil : ubs
        end

        bstr.push("0")
        return ubs if ubs = backtrack(i+1, bstr, counter, size)
        bstr.pop

        bstr.push("1")
        return ubs if ubs = backtrack(i+1, bstr, counter, size)
        bstr.pop

        nil
    end

    backtrack(0, [], nums.tally, nums.size)
end
