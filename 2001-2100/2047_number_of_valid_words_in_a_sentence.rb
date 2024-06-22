# @param {String} sentence
# @return {Integer}
def count_valid_words(sentence)
    punctuations = ["!", ".", ","]
    count = 0

    sentence.split(" ").each do |word|
        next count += 1 if word.size == 1 && ((word[0] >= "a" && word[0] <= "z") || punctuations.include?(word[0]))
        next unless word[0] >= "a" && word[0] <= "z"

        valid = true
        hyphens = 0
        (1...word.size-1).each do |i|
            c = word[i]
            case
            when c >= "a" && c <= "z"
            when c == "-"
                valid = hyphens == 0 && (word[i-1] >= "a" && word[i-1] <= "z" && word[i+1] >= "a" && word[i+1] <= "z")
                break unless valid
                hyphens += 1
            else
                valid = false
                break
            end
        end

        if valid && ((word[-1] >= "a" && word[-1] <= "z") || punctuations.include?(word[-1]))
            count += 1
        end
    end

    count
end
