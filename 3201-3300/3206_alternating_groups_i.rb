# @param {Integer[]} colors
# @return {Integer}
def number_of_alternating_groups(colors)
    (colors += colors[0..1]).each_cons(3).count { |group|
        group[0] == group[2] && group[0] != group[1]
    }
end
