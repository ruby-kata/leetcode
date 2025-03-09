# @param {Integer[]} colors
# @param {Integer} k
# @return {Integer}
def number_of_alternating_groups(colors, k)
    count = 0
    alter_length = 0
    size = colors.size
    # concat 2 colors to deal with circular
    (0...2*size).each { |i|
        if colors[i % size] != colors[(i-1) % size]
            alter_length += 1
            # to avoid counting duplicate groups, only count from the second colors
            count += 1 if alter_length >= k && i >= size
        else
            alter_length = 1
        end
    }
    count
end
