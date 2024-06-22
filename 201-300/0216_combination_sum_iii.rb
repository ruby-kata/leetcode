# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
    ans = []
    used = 0
    backtrack = lambda { |list, sum, start|
        if sum == n && list.size == k
            ans << list.clone
            return
        end

        return if list.size > k || sum > n

        (start..9).each do |i|
            next unless (used & (1 << i)) == 0

            used |= (1 << i)
            list.push(i)
            backtrack.call(list, sum + i, i + 1)
            list.pop
            used ^= (1 << i)
        end
    }
    
    backtrack.call([], 0, 1)
    ans
end
