# @param {String} s
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def maximum_gain(s, x, y)
    # explain why greedy work
    # assume "ba" > "ab"
    # in case: xbax, which x is not b nor b, of course we will remove ba
    # in case: abax, since ba > ab, so we will remove ba
    # in case: xbaa, we have no choice but remove ba
    # in case: abaa, since ba > ab, so we will remove ba
    # in case: bbax, we have no choice but remove ba
    # in case: bbab, we have no choice but remove ba
    # in case: abab, ba + ab > ab + ab => so we will remove ba first
    # in case: bbaa, of course, 2 ba
    # in case: baxx, which x is not b nor b, of course we will remove ba
    # in case: baax, of course we will remove ba
    # in case: baaa, same as above
    # in case: baab, ba + ab
    # in case: baba, of course, 2 ba
    # in case: babx, x is not a, ba > ab, so remove ba first
    # in case: xaba, x is not b, ba > ab, so remove ba first
    # in case: xbba, no matter x, remove ba first
    # ==> Any case, remove the substring which gain more points first
    #
    sum = 0
    max_sub = x >= y ? "ab" : "ba"
    max_point = x >= y ? x : y
    min_point = x >= y ? y : x
    stack = []
    s << "."
    s.each_char { |c|
        if c == "a" || c == "b"
            if !stack.empty? && stack[-1] == max_sub[0] && c == max_sub[1]
                sum += max_point
                stack.pop
            else
                stack << c
            end
        else
            # since above remove any max-sub "ba" or "ab"
            # so now stack is something like "aaaa...bbbb..." or "bbb...aaa..."
            a_count = stack.count("a")
            sum += [a_count, stack.length - a_count].min * min_point
            stack = []
        end
    }

    sum
end
