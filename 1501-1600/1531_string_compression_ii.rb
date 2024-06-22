# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_length_of_optimal_compression(s, k)
    dp = Array.new(s.size+1) { Array.new(k+1, Float::INFINITY) }
    dp[s.size] = Array.new(k+1, 0)

    (s.size-1).downto(0) do |i|
        (s.size-i..k).each do |d|
            dp[i][d] = 0
        end

        max_repeat = 0
        counter = Hash.new(0)
        (i...s.size).each do |j|
            counter[s[j]] += 1
            max_repeat = counter[s[j]] if max_repeat < counter[s[j]]
            len = max_repeat <= 1 ? max_repeat : max_repeat.to_s.size + 1
            k.downto(0) do |d|
                break if (l = j - i + 1 - max_repeat) > d

                dp[i][d] = [dp[i][d], dp[j+1][d-l] + len].min
            end
        end
    end

    dp[0][k]
end
