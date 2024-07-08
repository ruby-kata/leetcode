# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
    adj = Hash.new { |h,k| h[k] = [] }
    tickets.each do |from, to|
        adj[from].push(to)
    end
    adj.each do |k, arr|
        arr.sort!
    end

    itinerary = []
    stack = ["JFK"]
    until stack.empty?
        if adj[stack.last].empty?
            itinerary.unshift(stack.pop)
        else
            stack.push(adj[stack.last].shift)
        end
    end

    itinerary
end
