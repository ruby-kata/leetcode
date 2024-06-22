# @param {String} s
# @param {String[]} dictionary
# @return {Integer}
def min_extra_char(s, dictionary)
    dict = dictionary.map { |w| [w, true] }.to_h
    min = Array.new(s.size + 1, Float::INFINITY)
    min[s.size] = 0

    (s.size-1).downto(0) do |i|
        (i...s.size).each do |j|
            extra = (dict.has_key?(s[i..j]) ? 0 : j - i + 1) + min[j+1]
            min[i] = extra if min[i] > extra
        end
    end

    min[0]
end
