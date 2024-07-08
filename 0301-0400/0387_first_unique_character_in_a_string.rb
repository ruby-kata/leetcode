# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    s_chars =  s.chars
    counter = s_chars.tally
    s_chars.each_with_index do |c, i|
        return i if counter[c] == 1
    end

    -1
end

# def first_uniq_char(s)
#     s_chars = s.chars
#     appeared = Hash.new(false)
#     first_uniq_index = 0
#     curr_index = 1
#     until curr_index >= s_chars.size
#         if s_chars[first_uniq_index] == s_chars[curr_index]
#             appeared[s_chars[curr_index]] = true
#             first_uniq_index += 1 while appeared[s_chars[first_uniq_index]]
#             curr_index = first_uniq_index
#         end
#         curr_index += 1
#     end

#     first_uniq_index >= s_chars.size ? -1 : first_uniq_index
# end
