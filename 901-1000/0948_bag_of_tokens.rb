# @param {Integer[]} tokens
# @param {Integer} power
# @return {Integer}
def bag_of_tokens_score(tokens, power)
    tokens.sort!

    score = 0
    l = 0
    r = tokens.size-1
    while l < r
        if tokens[l] <= power
            score += 1
            power -= tokens[l]
            l += 1
        elsif score > 0
            score -= 1
            power += tokens[r]
            r -= 1
        else
            break
        end
    end
    score += 1 if l == r && tokens[l] <= power

    score
end
