# @param {Integer[]} arr
# @return {Void} Do not return anything, modify arr in-place instead.
def duplicate_zeros(arr)
    shifts = []
    (0...arr.length).each do |i|
        shifts.unshift(0) if arr[i].zero?
        unless shifts.empty?
            shifts.unshift(arr[i])
            arr[i] = shifts.pop
        end
    end
end
