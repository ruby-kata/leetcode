# @param {String} s
# @param {Integer} repeat_limit
# @return {String}
def repeat_limited_string(s, repeat_limit)
    counter = s.chars.tally
    characters = counter.keys.sort.reverse
    largest_lex_str = ""
    loop do
        last_char = largest_lex_str[largest_lex_str.size-1]
        next_char = characters.find { |c| counter[c] > 0 && c != last_char } 
        break if next_char.nil?

        not_clean = largest_lex_str.size > 0 && last_char > next_char && counter[last_char] > 0
        if not_clean
            r = [counter[next_char], (counter[last_char]/repeat_limit.to_f).ceil].min
            lr = [counter[last_char], repeat_limit].min

            largest_lex_str += "#{next_char}#{last_char * repeat_limit}" * (r-1)
            counter[next_char] -= r-1
            counter[last_char] -= repeat_limit * (r-1)

            remain = [counter[last_char], repeat_limit].min
            largest_lex_str += "#{next_char}#{last_char * remain}"
            counter[next_char] -= 1
            counter[last_char] -= remain
        else
            largest_lex_str += next_char * (r = [counter[next_char], repeat_limit].min)
            counter[next_char] -= r
        end

        characters.shift until characters.empty? || counter[characters.first] > 0
        break if characters.empty?
    end

    largest_lex_str
end
