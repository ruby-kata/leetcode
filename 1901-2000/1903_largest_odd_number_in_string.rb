# @param {String} num
# @return {String}
def largest_odd_number(num)
    odd_last_index = num.chars.rindex { |c| c.to_i.odd? }
    odd_last_index.nil? ? "" : num[0..odd_last_index] 
end
