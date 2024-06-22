# @param {String} corridor
# @return {Integer}
def number_of_ways(corridor)
    mod = 1000000007
    count = 0
    s = 0
    p = 0

    corridor.each_char do |c|
        if c == "S"
            s += 1
            if s == 2
                count = (count * (p + 1)) % mod
                count = 1 if count == 0
                s = 0
                p = 0
            end
        else
            p += 1 if s == 0
        end
    end

    s == 1 ? 0 : count
end
