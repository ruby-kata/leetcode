# @param {Integer[]} arr
# @return {Integer}
def num_of_subarrays(arr)
    mod = 1000000007
    count = 0
    odd_count = 0
    even_count = 0
    sum = 0
    arr.each { |x|
        sum += x
        if sum.odd?
            odd_count += 1
            count += even_count + 1
        else
            even_count += 1
            count += odd_count
        end
        count %= mod
    }

    count % mod
end
