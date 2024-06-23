# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
    max = 0
    heights = Array.new(matrix[0].length, 0)
    (0...matrix.length).each do |r|
        (0...matrix[0].length).each do |c|
            heights[c] = matrix[r][c] == '1' ? heights[c] + 1 : 0
        end

        mono_stack = []
        (0..matrix[0].length).each do |c|
            while !mono_stack.empty? && (c == matrix[0].length || heights[mono_stack.last] > heights[c])
                i = mono_stack.pop
                area = heights[i] * (mono_stack.empty? ? c : (c - mono_stack.last - 1))
                max = area if max < area
            end
            mono_stack.push(c)
        end
    end

    max
end
