# @param {String} boxes
# @return {Integer[]}
def min_operations(boxes)
    prefix_sum = Array.new(boxes.size, 0)

    ball_count = 0
    op_count = 0
    boxes.chars.each_with_index { |b, i|
        prefix_sum[i] += op_count
        ball_count += b.to_i
        op_count += ball_count
    }

    ball_count = 0
    op_count = 0
    boxes.chars.reverse.each_with_index { |b, i|
        prefix_sum[boxes.size-1-i] += op_count
        ball_count += b.to_i
        op_count += ball_count
    }

    prefix_sum
end
