# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
    t_counter = Hash.new(0)
    s_counter = Hash.new(0)

    t.chars.each do |c|
        t_counter[c] += 1
    end

    min_start = -1
    min_end = 0
    min = Float::INFINITY
    count = 0
    i = 0
    j = 0
    until j >= s.size
        if t_counter.has_key?(s[j])
            s_counter[s[j]] += 1
            count += 1 if s_counter[s[j]] == t_counter[s[j]]
        end

        while count == t_counter.size
            if min > j - i
                min_end = j
                min_start = i
                min = min_end - min_start
            end

            if t_counter.has_key?(s[i])
                s_counter[s[i]] -= 1
                count -= 1 if s_counter[s[i]] < t_counter[s[i]]
            end
            i += 1
        end

        j += 1
    end

    min_start > -1 ? s[min_start..min_end] : ""
end
