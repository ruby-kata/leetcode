# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
    return [] if s.length <= 10

    base = 37
    power = 1
    h = 0
    (0...10).each do |i|
        h = h + (s[i].ord - 64) * power
        power *= base
    end

    occured = {}
    occured[h] = true
    ans = {}
    (10...s.length).each do |i|
        h = (h + (s[i].ord - 64) * power) / base
        ans[s[i-9..i]] = true if occured[h]
        occured[h] = true
    end

    ans.keys
end
