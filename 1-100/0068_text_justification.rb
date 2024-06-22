# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
    justification = []
    line = []
    size = 0
    words.each do |word|
        if (size + word.size + line.size) > max_width
            spaces = max_width - size
            if line.size == 1
                justification << line.first + (" " * spaces)
            else
                (0...spaces).each do |i|
                    line[i % (line.size-1)] += " "
                end
                justification << line.join("")
            end
            line = []
            size = 0
        end

        line << word
        size += word.size
    end

    justification << line.join(" ") + (" " * (max_width - line.size + 1 - size))
    justification
end
