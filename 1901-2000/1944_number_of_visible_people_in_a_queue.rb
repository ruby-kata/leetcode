# @param {Integer[]} heights
# @return {Integer[]}
def can_see_persons_count(heights)
    ans = Array.new(heights.size, 0)
    stack = []
    heights.each_with_index { |h, i|
        while !stack.empty? && heights[stack.last] < h
            # each of previous with height < h will see the i-th
            ans[stack.pop] += 1
        end

        # the last will see the i-th
        ans[stack.last] += 1 unless stack.empty?

        stack.push(i)
    }

    ans
end
