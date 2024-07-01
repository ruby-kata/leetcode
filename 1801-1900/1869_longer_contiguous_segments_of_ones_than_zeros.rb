# @param {String} s
# @return {Boolean}
def check_zero_ones(s)
    counter = { '0' => 0, '1' => 0 }
    max_count = { '0' => 0, '1' => 0 }
    prev = nil

    s.each_char { |c|
        if c != prev
            max_count[prev] = [max_count[prev], counter[prev]].max unless prev.nil?
            counter[c] = 1
        else
            counter[c] += 1
        end
        prev = c
    }
    max_count[prev] = [max_count[prev], counter[prev]].max
    
    max_count['1'] > max_count['0']
end
