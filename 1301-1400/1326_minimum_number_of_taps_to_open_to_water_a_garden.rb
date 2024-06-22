# @param {Integer} n
# @param {Integer[]} ranges
# @return {Integer}
def min_taps(n, ranges)
    expands = Array.new(n+1, 0)
    ranges.each_with_index do |r, i|
        l = [i - r, 0].max
        r = [i + r, n].min
        expands[l] = r - l if expands[l] < r - l
    end

    taps = 0
    max = 0
    reach = 0
    (0...n).each do |i|
        break if i > max
        max = [max, i + expands[i]].max
        if i == reach
            taps += 1
            reach = max
        end
    end

    reach >= n ? taps : -1
end
