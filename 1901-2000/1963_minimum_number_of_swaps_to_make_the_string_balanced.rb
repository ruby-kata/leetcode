# @param {String} s
# @return {Integer}
def min_swaps(s)
    open_count = 0
    s.each_char { |c|
        if c == "["
            open_count += 1
        else
            # greedy:
            # when met the close bracket, matching it with the last open bracket (if any)
            open_count -= 1 if open_count > 0
        end
    }

    # remain open brackets that not matched
    # it's pattern should be like this [[[..., and there're previous ]]]... which matched with it
    # since if any ] in between, one open bracket should be matched as above
    # with this pattern we just need a half swap, since with each swap there's another bracket automatically matched
    (open_count + 1)/2
end
