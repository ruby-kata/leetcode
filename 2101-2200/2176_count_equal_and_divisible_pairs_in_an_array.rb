# brute force
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_pairs(nums, k)
    count = 0
    (0...nums.size).each { |i|
        (i+1...nums.size).each { |j|
            count += 1 if nums[i] == nums[j] && (i * j) % k == 0
        }
    }

    count
end

# optimal
def count_pairs(nums, k)
    num_indexes = Hash.new { |h, k| h[k] = [] }
    nums.each_with_index { |num, i|
        num_indexes[num] << i
    }

    count = 0
    num_indexes.values.each { |indexes|
        gcds = Array.new(k+1, 0)
        indexes.each { |index|
            gcd_i = index.gcd(k)
            gcds.each_with_index { |c, gcd_j|
                count += c if (gcd_i * gcd_j) % k == 0
            }
            gcds[gcd_i] += 1
        }
    }

    count
end
