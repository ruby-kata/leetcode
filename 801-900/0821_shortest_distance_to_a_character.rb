# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
    ans = Array.new(s.size, s.size)
    prev = -1
    (0...s.size).each do |i|
        if s[i] == c
            (prev+1..i).each do |j|
                ans[j] = [ans[j], i - j].min
            end
            prev = i
        elsif prev >= 0
            ans[i] = i - prev
        end
    end

    ans
end
