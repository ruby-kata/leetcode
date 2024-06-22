# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
    x1, y1 = coordinates.pop
    x2, y2 = coordinates.pop
    if x1 == x2
        coordinates.all? { |x,_| x == x1 }
    else
        a = (y1 - y2).to_f/(x1 - x2)
        b = y1 - a*x1
        coordinates.all? { |x, y|
            y == a*x + b
        }
    end
end
