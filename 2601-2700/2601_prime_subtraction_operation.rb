# @param {Integer[]} nums
# @return {Boolean}
def prime_sub_operation(nums)
    return true if nums.size == 1

    max = nums.max
    primes = sieve_of_eratosthenes(max)

    nums.unshift(0)
    (1...nums.length).each { |i|
        optimal = upper_bound(primes, nums[i] - nums[i-1])
        nums[i] -= optimal if optimal
        return false unless nums[i] > nums[i-1]
    }

    true
end

# an efficient way to find all primes smaller than n
def sieve_of_eratosthenes(n)
    is_prime = Array.new(n+1, true)
    (2..Math.sqrt(n)).each { |i|
        next if !is_prime[i]

        j = i * i
        while j <= n
            is_prime[j] = false
            j += i
        end
    }

    (2..n).filter { |i| is_prime[i] }
end

# find the largest that < x
def upper_bound(sorted_arr, x)
    mid = nil
    low = 0
    high = sorted_arr.size-1
    while low < high
        mid = (high + low)/2
        if sorted_arr[mid] < x
            low = mid + 1
        else
            high = mid
        end
    end

    low -= 1 if low > 0 && sorted_arr[low] >= x
    sorted_arr[low] < x ? sorted_arr[low] : nil
end
