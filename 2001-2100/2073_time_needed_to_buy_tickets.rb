# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
    time = tickets[k] * tickets.length
    tickets.each_with_index do |t, i|
        time -= tickets[k] - t if tickets[k] > t
        time -= 1 if tickets[k] <= t && i > k
    end

    time
end
