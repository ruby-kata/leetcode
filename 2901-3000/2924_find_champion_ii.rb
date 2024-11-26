# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def find_champion(n, edges)
    in_degrees = Array.new(n, 0)
    edges.each { |s, w|
        in_degrees[w] += 1
    }

    strongest = -1
    (0...in_degrees.length).each { |i| 
        if in_degrees[i] == 0
            return -1 if strongest >= 0
            strongest = i
        end
    }
    strongest
end
