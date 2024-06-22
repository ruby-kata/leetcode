# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
    counter = Array.new(101, 0)
    heights.each do |h|
        counter[h] += 1
    end

    i = 0
    not_match = 0
    counter.each_with_index do |count, j|
        while count > 0
            not_match += 1 if heights[i] != j
            count -= 1
            i += 1
        end
    end

    not_match
end
