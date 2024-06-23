# @param {Integer[]} nums
# @return {Integer}
def array_pair_sum(nums)
    nums.sort!
    0.step(nums.size - 1, 2).reduce(0) { |sum, i| sum += nums[i] }
end

# counting
def array_pair_sum(nums)
    counter = Hash.new(0)
    max, min = 0, Float::INFINITY
    nums.each do |num|
        counter[num] += 1
        max = num if max < num
        min = num if min > num
    end

    sum = 0
    prev = nil
    (min..max).each do |num|
        next unless counter.has_key?(num)

        if counter[prev] > 0
            sum += counter[prev] * prev
            counter[num] -= counter[prev]
        end

        sum += num * (counter[num] / 2)
        counter[num] = counter[num] % 2
        prev = num
    end

    sum
end
