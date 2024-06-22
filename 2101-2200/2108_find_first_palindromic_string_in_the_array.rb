# @param {String[]} words
# @return {String}
def first_palindrome(words)
    words.find do |word|
        i = 0
        j = word.size - 1
        is_palindrome = true
        while i < j
            if word[i] != word[j]
                is_palindrome = false
                break 
            end
            i += 1
            j -= 1
        end

        is_palindrome
    end || ""
end
