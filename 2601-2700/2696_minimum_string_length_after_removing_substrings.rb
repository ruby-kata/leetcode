# @param {String} s
# @return {Integer}
def min_length(s)
    removable = [["A", "B"], ["C", "D"]].freeze
    stack = []
    s.chars.each { |c|
        stack << c
        while stack.length >= 2 && removable.include?(stack[-2..-1])
            stack.pop(2)
        end
    }

    stack.length
end
