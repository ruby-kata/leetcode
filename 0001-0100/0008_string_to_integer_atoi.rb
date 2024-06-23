FIX_MAX = 2147483647 
FIX_MIN = -2147483648
ZERO = "0".ord

def my_atoi(s)
    atoi = nil
    sign = nil
    i = 0
    while i < s.length
        if s[i] >= "0" && s[i] <= "9"
            atoi ||= 0
            atoi = (atoi * 10) + (s[i].ord - ZERO)
        else
            break unless atoi.nil? && sign.nil?
            if s[i] == "+"
                sign = 1
            elsif s[i] == "-"
                sign = -1
            elsif s[i] != " "
                break
            end
        end
        i += 1
    end

    atoi = (atoi || 0) * (sign || 1)
    atoi < FIX_MIN ? FIX_MIN : (atoi > FIX_MAX ? FIX_MAX : atoi)
end
