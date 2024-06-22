# @param {String} s
# @return {Integer}
def min_operations(s)
    even_first = 0
    odd_first = 0
    s.each_char.with_index do |c, i|
        ci = c.to_i
        mod = i % 2
        even_first += 1 if ci != mod
        odd_first += 1 if ci != 1 - mod
    end

    even_first < odd_first ? even_first : odd_first
end
