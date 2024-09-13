# @param {Integer[]} arr
# @param {Integer[][]} queries
# @return {Integer[]}
def xor_queries(arr, queries)
    prefix_sum = [0]
    arr.each { |x|
        prefix_sum << (prefix_sum[-1] ^ x)
    }

    queries.map { |(i, j)|
        prefix_sum[j+1] ^ prefix_sum[i] 
    }
end
