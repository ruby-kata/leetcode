# @param {String} s
# @param {Integer} k
# @return {Integer}
def longest_ideal_string(s, k)
    max = 0
    longest = Array.new(26, 0)
    (s.length-1).downto(0) do |i|
        i_ord = s[i].ord - 97
        l = [i_ord-k, 0].max
        r = [i_ord+k, 25].min
        longest[i_ord] = 1 + longest[l..r].max
        max = [max, longest[i_ord]].max
    end

    max
end
