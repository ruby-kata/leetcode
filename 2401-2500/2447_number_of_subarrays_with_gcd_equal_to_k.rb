# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_gcd(nums, k)
    def gcd(a, b)
        return a if b.zero?

        gcd(b, a % b)
    end

    count = 0
    counter = Hash.new(0)
    nums.each do |num|
        if num % k == 0
            next_counter = Hash.new(0)
            counter.each do |(key, val)|
                next_counter[gcd(key, num)] += val
            end
            next_counter[num] += 1

            count += next_counter[k]
            counter = next_counter
        else
            counter.clear
        end
    end

    count
end
