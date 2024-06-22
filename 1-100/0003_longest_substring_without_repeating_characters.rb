def length_of_longest_substring(s)
    counter = Hash.new(0)
    left = right = 0
    max = 0

    while right < s.length
        counter[s[right]] += 1
        until counter[s[right]] == 1
            counter[s[left]] -= 1
            left += 1
        end

        right += 1
        if (len = right - left) > max then max = len end
    end

    max
end
