# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
    graph = Hash.new { |h, k| h[k] = [] }
    (0...ring.length).each do |i|
        graph[ring[i]] << i
    end

    shortest = [[0, 0]]
    ci = 0
    while ci < key.length
        s = []
        c = key[ci]
        graph[c].each do |j|
            m = shortest.map do |(d, i)|
                d + [ij = (j - i).abs, ring.length - ij].min + 1
            end.min
            s << [m, j]
        end

        shortest = s
        ci += 1
    end

    shortest.min_by(&:first).first
end
