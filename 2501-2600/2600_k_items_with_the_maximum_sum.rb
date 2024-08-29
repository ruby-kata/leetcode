# @param {Integer} num_ones
# @param {Integer} num_zeros
# @param {Integer} num_neg_ones
# @param {Integer} k
# @return {Integer}
def k_items_with_maximum_sum(num_ones, num_zeros, num_neg_ones, k)
    k > num_ones + num_zeros ? num_ones - [k - num_ones - num_zeros, num_neg_ones].min : [k, num_ones].min
end

def k_items_with_maximum_sum(num_ones, num_zeros, num_neg_ones, k)
    ([1] * num_ones + [0] * num_zeros + [-1] * num_neg_ones)[...k].sum 
end
