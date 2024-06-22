# @param {String} s
# @return {String}
def reorganize_string(s)
    counter = Hash.new(0)
    s.each_char do |c|
        counter[c] += 1
    end
    
    pq = counter.entries.sort_by! { |c| c[1] }
    rearrange = []
    until pq.size <= 1
        first = pq.pop
        second = pq.pop
        if first[0] == rearrange.last
            rearrange.push(second[0], first[0])
        else
            rearrange.push(first[0], second[0])
        end
        first[1] -= 1
        second[1] -= 1
        pq.push(first) if first[1] > 0
        pq.push(second) if second[1] > 0

        pq.sort_by!  { |c| c[1] }
    end

    last = pq.pop
    return "" if last && last[1] > 1
    rearrange.push(last[0]) if last && last[1] == 1

    rearrange.join("")
end
