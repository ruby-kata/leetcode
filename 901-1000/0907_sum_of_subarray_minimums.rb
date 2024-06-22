# @param {Integer[]} arr
# @return {Integer}
def sum_subarray_mins(arr)
    mod = 1000000007
    sum = 0
    arr.push(0)
    stack = [[arr.first, 0]]
    (1...arr.size).each do |i|
        until stack.empty? || stack.last.first < arr[i]
            x, j = stack.pop
            k = stack.last&.last || -1
            sum += ((i - j) * (j - k)) * x
            sum %= mod
        end
        stack.push([arr[i], i])
    end
    
    sum
end
