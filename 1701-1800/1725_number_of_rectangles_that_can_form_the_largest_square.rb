# @param {Integer[][]} rectangles
# @return {Integer}
def count_good_rectangles(rectangles)
    squares = rectangles.map(&:min)
    squares.count(squares.max)
end
