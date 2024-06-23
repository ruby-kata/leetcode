# @param {Integer[]} difficulty
# @param {Integer[]} profit
# @param {Integer[]} worker
# @return {Integer}
def max_profit_assignment(difficulty, profit, worker)
    difficulty_sorted = difficulty.zip(profit).sort_by(&:first)
    difficulty_sorted << [Float::INFINITY, difficulty_sorted.last[1]]

    max_profits = Array.new(difficulty_sorted.size, 0)
    max_profits[0] = difficulty_sorted[0][1]
    (1...difficulty_sorted.size).each do |i|
        max_profits[i] = [max_profits[i-1], difficulty_sorted[i][1]].max
    end
    
    worker.inject(0) do |sum, max_difficulty|
        index = difficulty_sorted.bsearch_index { |(d, p)| d >= (max_difficulty + 1) } - 1
        sum += (index >= 0 ? max_profits[index] : 0)
    end
end
