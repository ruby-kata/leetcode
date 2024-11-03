# @param {String} s
# @param {String} goal
# @return {Boolean}
def rotate_string(s, goal)
    return false if s.length != goal.length

    (0...s.length).any? { |i|
        s[i..-1] == goal[0..s.length-1-i] && s[0..i-1] == goal[-i..-1]
    }
end

# better ???
def rotate_string(s, goal)
    return false if s.length != goal.length

    (s + s).include?(goal)
end
