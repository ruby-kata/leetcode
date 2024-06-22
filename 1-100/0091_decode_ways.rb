# @param {String} s
# @return {Integer}
def num_decodings(s)
    return 0 if s[0] == "0"

    count_next_next = 1
    count_next = s[-1] == "0" ? 0 : 1
    (s.length-2).downto(0) do |i|
        count = 0
        if s[i] == "1"
            count += count_next if count_next > 0
            count += count_next_next if count_next_next > 0
        elsif s[i] == "2"
            count += count_next if count_next > 0
            count += count_next_next if count_next_next > 0 && s[i+1] <= "6"
        elsif s[i] != "0"
            count += count_next if count_next > 0
        end

        count_next_next = count_next
        count_next = count
    end

    count_next
end
