# @param {Integer[]} arr
# @return {Integer}
def find_special_integer(arr)
    a_quater = arr.size/4 # 25%
    (0...arr.size).each do |i|
        return arr[i] if arr[i] == arr[i + a_quater] # since arr is sorted
    end
end
