# @param {String} word
# @return {String}
def compressed_string(word)
    comp = ""
    prev_c = ""
    count = 0
    (word << ".").each_char { |c|
        if prev_c == c
            count += 1
        else
            nine_times = count/9
            remain = count % 9
            comp << ("9#{prev_c}" * nine_times) + (remain > 0 ? "#{remain}#{prev_c}" : "")
            prev_c = c
            count = 1
        end
    }

    comp
end
