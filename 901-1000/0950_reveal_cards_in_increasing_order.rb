# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
    deck.sort!
    ordered = Array.new(deck.size, 0)
    flag = 1
    i = 0
    until deck.empty?
        if ordered[i].zero?
            ordered[i] = deck.shift if flag == 1
            flag = 1 - flag
        end
        i = (i + 1) % ordered.size
    end

    ordered
end
