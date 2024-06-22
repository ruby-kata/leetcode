# @param {String} path
# @return {Boolean}
def is_path_crossing(path)
    points = Hash.new
    points["#{x=0},#{y=0}"] = true

    path.chars.each do |d|
        case d
        when 'N'
            y += 1
        when 'S'
            y -= 1
        when 'E'
            x += 1
        when 'W'
            x -= 1
        end

        new_point = "#{x},#{y}"
        return true if points.key?(new_point)

        points[new_point] = true
    end

    false
end
