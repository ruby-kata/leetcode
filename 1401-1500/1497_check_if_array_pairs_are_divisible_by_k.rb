# @param {Integer[]} arr
# @param {Integer} k
# @return {Boolean}
def can_arrange(arr, k)
    mod = Hash.new(0)
    arr.each { |num| mod[num % k] += 1 }
    mod.each { |m, count|
        return false if (m.zero? || m == k - m) ? count.odd? : mod[k - m] != count
    }

    true
end
