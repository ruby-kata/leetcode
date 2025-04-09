def min_operations(nums, k)
    return -1 if nums.any? { |num| num < k }
    nums.uniq.count { |num| num > k }
end
