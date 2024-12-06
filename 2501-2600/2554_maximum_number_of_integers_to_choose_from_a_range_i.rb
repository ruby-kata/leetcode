# @param {Integer[]} banned
# @param {Integer} n
# @param {Integer} max_sum
# @return {Integer}
def max_count(banned, n, max_sum)
    banned = banned.map { |b| [b, true] }.to_h
    count = 0
    sum = 0
    (1..n).each { |x|
        next if banned.has_key?(x)
        
        sum += x
        return count if sum > max_sum

        count += 1
    }
    count
end
