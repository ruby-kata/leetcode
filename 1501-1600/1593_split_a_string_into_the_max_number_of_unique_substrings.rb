# @param {String} s
# @return {Integer}
def max_unique_split(s)
    max = 0
    backtrack = lambda { |i, hash|
        if i >= s.length
            max = [max, hash.size].max
            return
        end

        (i...s.length).each { |j|
            key = s[i..j]
            unless hash.has_key?(key)
                hash[key] = true
                backtrack.call(j+1, hash)
                hash.delete(key)
            end
        }
    }

    backtrack.call(0, {})
    max
end
