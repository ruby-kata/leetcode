# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def get_winner(arr, k)
    win = 0
    x = arr.first
    (1...arr.size).each do |i|
        return x if win == k
        
        num = arr[i]
        if x > num
            win += 1
        else
            win = 1
            x = num
        end
    end

    x
end
