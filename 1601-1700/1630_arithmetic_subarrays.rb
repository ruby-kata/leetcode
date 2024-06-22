# @param {Integer[]} nums
# @param {Integer[]} l
# @param {Integer[]} r
# @return {Boolean[]}
def check_arithmetic_subarrays(nums, l, r)
    (0...l.size).map do |i|
        s = l[i]
        e = r[i]
        if e - s >= 2
            max = -Float::INFINITY
            min = Float::INFINITY
            appear = Hash.new(false)
            (s..e).each do |j|
                max = nums[j] if nums[j] > max
                min = nums[j] if nums[j] < min
                appear[nums[j]] = true
            end

            if (max - min) % (e-s) == 0
                is_arithmetic = true
                delta = (max - min) / (e - s)
                (s+1..e).each do |j|
                    min += delta
                    unless appear.has_key?(min)
                        is_arithmetic = false
                        break
                    end
                end

                is_arithmetic
            else
                false
            end
        else
            true
        end
    end
end
