# @param {String} order
# @param {String} s
# @return {String}
def custom_sort_string(order, s)
    counter = s.chars.tally
    sorted = ""
    order.each_char do |c|
        sorted << (c * counter.delete(c).to_i)
    end

    ('a'..'z').each do |c|
        sorted << (c * counter.delete(c).to_i)
    end

    sorted
end
