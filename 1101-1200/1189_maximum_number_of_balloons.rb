# @param {String} text
# @return {Integer}
def max_number_of_balloons(text)
    counter = text.chars.tally
    count = 0

    loop do
        "balloon".each_char do |c|
            return count if !counter.has_key?(c) or counter[c] <= 0
            counter[c] -= 1 
        end
        count += 1
    end
end
