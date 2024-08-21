# @param {String} s
# @return {Integer}
def minimum_beautiful_substrings(s)
    return -1 if s[0] == '0' || s[-1] == '0'

    is_power_of_five = lambda { |num|
        while num > 1 && (num % 5 == 0)
            num /= 5
        end

        num == 1
    }

    dp = Array.new(s.length+1, Float::INFINITY)
    dp[s.length] = 0

    (s.length-1).downto(0) { |i|
        next if s[i] == '0'
        (i...s.length).each { |j|
            if is_power_of_five.call(s[i..j].to_i(2))
                dp[i] = [dp[i], 1 + dp[j+1]].min
            end
        }
    }

    dp[0] == Float::INFINITY ? -1 : dp[0]
end
