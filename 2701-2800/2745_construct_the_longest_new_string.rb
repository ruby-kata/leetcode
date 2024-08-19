# @param {Integer} x
# @param {Integer} y
# @param {Integer} z
# @return {Integer}
def longest_string(x, y, z)
    # greedy
    (   
        # it can be proved that ALL 'AB's can be used in the optimal solution. 
        # if the final string (construct by 'AA' and 'BB') starts with 'A', we can put all unused 'AB's at the very beginning.
        # if it starts with 'B' (meaning) it starts with “BB”, we can put all unused “AB”s at the end.
        z +
        # for 'AA' and 'BB', the longest we can construct by placing them alternatively,
        # start with the larger number one
        2 * (x <= y ? x : y) + ((x - y).abs > 0 ? 1 : 0)
    ) * 2
end
