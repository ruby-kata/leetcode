# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
    last_indexes = Array.new(26)
    s.each_char.with_index do |c, i|
        last_indexes[c.ord-97] = i
    end

    stack = []
    s.each_char.with_index do |c, i|
        next if stack.include?(c)

        while !stack.empty? && stack.last.ord > c.ord && last_indexes[stack.last.ord-97] > i
            stack.pop
        end

        stack.push(c)
    end

    stack.join("")
end
