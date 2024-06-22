# @param {Integer[][]} matches
# @return {Integer[][]}
def find_winners(matches)
    winners = Hash.new(0)
    losers = Hash.new(0)
    matches.each do |w, l|
        winners[w] += 1
        losers[l] += 1
    end

    answer = Array.new(2) { [] }
    answer[0] += winners.filter { |k,v| losers[k] == 0 }.keys.sort
    answer[1] += losers.filter { |k,v| v == 1 }.keys.sort

    answer
end
