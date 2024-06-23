# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
    g.sort!
    s.sort!
    i = 0
    j = 0
    c = 0
    while i < g.size && j < s.size
        if g[i] <= s[j]
            c += 1 
            i += 1
        end
        j += 1
    end

    c
end
