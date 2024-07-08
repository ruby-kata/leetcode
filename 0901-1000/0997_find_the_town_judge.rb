# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
    counter = (1..n).map { |i| [i, [0, 0]] }.to_h
    trust.each do |(a, b)|
        counter[a][0] += 1
        counter[b][1] += 1
    end

    counter.find { |k, (a, b)| a == 0 && b == n-1 }&.first || -1
end
