# @param {String} s
# @return {Integer}
def maximum_length(s)
    max = -1
    counter = Hash.new(0)
    (0...s.length).each { |i|
        (i...s.length).each { |j|
            break if s[j] != s[i]
            
            sub = s[i..j]
            counter[sub] += 1
            if counter[sub] >= 3
                max = [max, j-i+1].max
            end
        }
    }

    max
end

# optimize
def maximum_length(s)
    counter = Array.new(26) { Array.new(s.length+1, 0) }
  
    prev = nil
    len = 1
    s.each_char { |c|
        if prev == c
            counter[c.ord - 97][len += 1] += 1
        else
            len = 1
            counter[c.ord - 97][len] += 1
            prev = c
        end
    }
  
    max = -1
    (0..25).each { |i|
        len = s.length
        # a substring with len has 2 substring with len-1, prefix and suffix
        count = 0
        while len >= 1
            count += counter[i][len]
            if count >= 3
                max = len if max < len
                break
            end
            len -= 1 
        end
    }
  
    max
end
