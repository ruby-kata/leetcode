# @param {String} s
# @return {Integer}
def min_deletions(s)
    counter = Hash.new(0)
    max = 0
    s.each_char do |c|
        counter[c] += 1
        max = counter[c] if counter[c] > max
    end

    frequencies = Array.new(max+1, 0)
    counter.each do |c, count|
        frequencies[count] += 1
    end

    deleted = 0
    (max).downto(1) do |i|
        next if frequencies[i] <= 1

        (i-1).downto(1) do |j|
            if frequencies[j].zero?
                frequencies[j] += 1
                frequencies[i] -= 1
                deleted += i - j
            end
            break if frequencies[i] == 1
        end

        if frequencies[i] > 1
            deleted += (frequencies[i] - 1) * i
            frequencies[i] = 1
        end
    end

    deleted
end
