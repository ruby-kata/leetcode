# @param {String} moves
# @return {Integer}
def furthest_distance_from_origin(moves)
    l = 0
    r = 0
    moves.each_char do |c|
        if c == "L"
            l += 1
        elsif c == "R"
            r += 1
        end
    end

    moves.size - (l + r) + (l - r).abs
end
