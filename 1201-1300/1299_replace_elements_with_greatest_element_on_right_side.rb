# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements(arr)
    max = -1
    (arr.size-1).downto(0) do |i|
        rmost = arr[i]
        arr[i] = max
        max = rmost if rmost > max
    end
    arr
end
