# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
def job_scheduling(start_time, end_time, profit)
    jobs = [start_time, end_time, profit].transpose.sort_by(&:first)
    max_profits = Array.new(profit.size+1, 0)
    
    (jobs.size-1).downto(0) do |i|
        j = jobs.bsearch_index { |job| job[0] >= jobs[i][1] } || jobs.size
        max_profits[i] = [jobs[i][2] + max_profits[j], max_profits[i+1]].max
    end

    max_profits[0]
end
