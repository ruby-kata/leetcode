# @param {Integer} red
# @param {Integer} blue
# @return {Integer}
def max_height_of_triangle(red, blue)
    count_height = lambda { |balls|
        h = 0
        len = 1
        i = 0
        while balls[i] >= len
            balls[i] -= len
            i = 1 - i
            len += 1
            h += 1
        end

        h
    }

    [count_height.call([red, blue]), count_height.call([blue, red])].max
end
