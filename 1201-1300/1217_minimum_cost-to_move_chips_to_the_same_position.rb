# @param {Integer[]} position
# @return {Integer}
def min_cost_to_move_chips(position)
    # 0 <-- 2 <-- 4 ...     cost 0
    #   1  <-- 3 <-- 5 ...  cost 0
    costs = [0, 0]
    position.each do |p|
        costs[p % 2] += 1
    end
    # min = min [cost move from 1 to 0, cost move from 0 to 1]
    costs.min
end
