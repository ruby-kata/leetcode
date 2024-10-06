# @param {String} sentence1
# @param {String} sentence2
# @return {Boolean}
def are_sentences_similar(sentence1, sentence2)
    words1 = sentence1.split(" ")
    words2 = sentence2.split(" ")
    p1_left = p2_left = 0
    p1_right = words1.length - 1
    p2_right = words2.length - 1
    until (p1_left > p1_right) || (p2_left > p2_right)
        equal_l = words1[p1_left] == words2[p2_left]
        equal_r = words1[p1_right] == words2[p2_right]
        return false if !equal_l && !equal_r

        if equal_l
            p1_left += 1
            p2_left += 1
        end

        if equal_r
            p1_right -= 1
            p2_right -= 1
        end
    end

    true
end
