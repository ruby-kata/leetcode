# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} minutes
# @return {Integer}
def max_satisfied(customers, grumpy, minutes)
    customer_prefix_sum = Array.new(customers.length, 0)
    satisfy_prefix_sum = Array.new(grumpy.length, 0)
    customer_prefix_sum[0] = customers[0]
    satisfy_prefix_sum[0] = (1 - grumpy[0]) * customers[0]

    (1...grumpy.length).each { |i| 
        satisfy_prefix_sum[i] = satisfy_prefix_sum[i-1] + (1 - grumpy[i]) * customers[i]
        customer_prefix_sum[i] = customer_prefix_sum[i-1] + customers[i]
    }

    max_sum = 0
    i = 0
    while i <= customers.length - minutes
        sum = customer_prefix_sum[i + minutes - 1] - (i > 0 ? customer_prefix_sum[i-1] : 0)
        sum += (i > 0 ? satisfy_prefix_sum[i-1] : 0) + satisfy_prefix_sum.last - satisfy_prefix_sum[i + minutes - 1]

        max_sum = sum if sum > max_sum
        i += 1
    end

    max_sum
end
